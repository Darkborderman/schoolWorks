#include <stdio.h>
#include <stdlib.h>
#include <limits.h>
#include <time.h>

typedef struct cache
{
	int valid;
	unsigned int tag;
	int time;//save last used time or initial time
}cache;

//function declare
void array_init(cache *, int);
int mintime(cache *, int);
int logdiv(int, int);

int main(int argc, char *argv[])
{
	srand(time(NULL));//we will use random later
	int cache_size, block_size, associate, policy;//data we read
	int blocks, index, offset, tags_bit, index_bit;//data we use
	int record_time, i, victim;//i use in for loop, victim judge replace or not
	unsigned int data, tags;//data use to read data

	FILE *IN, *OUT;//input output file
	IN=fopen(argv[1],"r");
	OUT=fopen(argv[2],"w");
	fscanf(IN, "%d", &cache_size);
	fscanf(IN, "%d", &block_size);
	fscanf(IN, "%d", &associate );
	fscanf(IN, "%d", &policy    );
	blocks = cache_size*1024/block_size;
	offset = logdiv(block_size, 2);

	if(associate == 0)
	{
		cache *array = malloc(blocks * sizeof(cache));//malloc cache
		array_init(array, blocks);//at least valid need to be all 0
		index_bit = logdiv(blocks, 2);
		tags_bit = 32-index_bit-offset;
		while(fscanf(IN, "%x", &data) != EOF)//read in hex type
		{
			index = (data << tags_bit) >> (tags_bit + offset);//use shift to get information you need
			tags = data >> (index_bit + offset);
			if (array[index].valid == 0)//not full
			{
				array[index].valid = 1;
				array[index].tag = tags;
				fprintf(OUT, "-1\n");
			}
			else//full and not find
			{
				array[index].valid = 1;
				if(array[index].tag == tags)
					fprintf(OUT, "-1\n");
				else
					fprintf(OUT, "%u\n", array[index].tag);//print previous tags
				array[index].tag = tags;
			}
		}
		free(array);//free the cache
	}
	if(associate ==2)
	{
		cache *array = malloc(blocks*sizeof(cache));//malloc cache
		array_init(array, blocks);
		int record_index = 0;//only use in associate 2, know which is the latest read.
		int pub_time = 1;
		tags_bit = 32 - offset;
		while(fscanf(IN,"%x", &data) != EOF)
		{
			tags = data >> offset;
			victim = 1;
			//search
			for(i=0; i<blocks; i++)
			{
				if(array[i].valid == 1 && array[i].tag == tags)
				{
					if(policy == 1)
						array[i].time = pub_time;//only 1 need to update time, and 0 don't
					record_index = i;
					fprintf(OUT, "-1\n");
					victim = 0;
					break;
				}	
			}
			//not full can insert
			if(victim)
			{
				for(i=0; i<blocks; i++)
				{
					if(array[i].valid == 0)
					{
						array[i].valid = 1;
						array[i].time = pub_time;
						array[i].tag = tags;
						fprintf(OUT, "-1\n");
						record_index = i;
						victim = 0;
						break;
					}
				}
			}
			//victim
			if(victim)
			{
				int del;//block you delete
				if(policy == 2)
				{
					do
					{
						del = rand()%blocks;
					}while(del == record_index);//you can't choose the latest
				}
				else del = mintime(array, blocks);
				fprintf(OUT, "%u\n", array[del].tag);
				array[del].valid = 1;
				array[del].tag = tags;
				array[del].time = pub_time;//time need to update
				record_index = del;
			}
			pub_time++;//after everytimes read, time will increase
		}
		free(array);//free your cache
	}
	if(associate == 1)
	{
		cache **array = malloc((blocks/4)*sizeof(cache *));//2 dimension array
		for(i=0; i<blocks/4; i++)
			array[i] = malloc(4*sizeof(cache));
		for(i=0; i<blocks/4; i++)
		{
			int j;
			for(j=0; j<4; j++)//initial array
				array[i][j].valid = 0;
		}
		index_bit = logdiv(blocks/4, 2);
		tags_bit = 32-index_bit-offset;
		int pub_time = 1;
		while(fscanf(IN, "%x", &data) != EOF)
		{
			index = (data << tags_bit) >> (tags_bit + offset);
			tags = data >> (index_bit + offset);
			victim = 1;
			//search
			for(i=0; i<4; i++)
			{
				if(array[index][i].valid == 1 && array[index][i].tag == tags)
				{
					if(policy != 0)
						array[index][i].time =pub_time;
					fprintf(OUT, "-1\n");
					victim = 0;
					break;
				}
			}
			//insert or not
			if(victim)
			{
				for(i=0; i<4; i++)
				{
					if(array[index][i].valid == 0)
					{
						array[index][i].valid = 1;
						array[index][i].time = pub_time;
						array[index][i].tag = tags;
						fprintf(OUT, "-1\n");
						victim = 0;
						break;
					}
				}
			}
			//victim
			if(victim)
			{
				int del,min,max;
				int min_time, max_time;
				min_time = INT_MAX;
				max_time = 0;
				for(i=0; i<4; i++)
				{
					if(array[index][i].time < min_time)
					{
						min_time = array[index][i].time;
						min = i;
					}
					if(array[index][i].time > max_time)
					{
						max_time = array[index][i].time;
						max = i;
					}
				}
				if(policy == 2)
				{
					do
					{
						del = rand()%4;					
					}while(del == max);
				}
				else del = min;
				fprintf(OUT, "%u\n", array[index][del].tag);
				array[index][del].valid = 1;
				array[index][del].time = pub_time;
				array[index][del].tag = tags;
			}
			pub_time++;
		}
		for(i=0; i<blocks/4; i++)//release array, 2 dimension
			free(array[i]);
		free(array);
	}
	fclose(IN);//remeber close it, more save
	fclose(OUT);
	return 0;
}
void array_init(cache *array, int blocks)
{
	int i;
	for(i=0; i < blocks; i++)
		array[i].valid == 0;
}
int mintime(cache *array, int blocks)
{
	int i, index;
	int min_time = INT_MAX;
	for(i=0; i<blocks; i++)
	{
		if (array[i].time < min_time)
		{
			index = i;
			min_time = array[i].time;
		}
	}
	return index;
}
int logdiv(int a, int b)
{
	if (a == 1) return 0;
	int ans = 1;
	while(a > b)
	{
		a = a/b;
		ans++;
	}
	return ans;
}
