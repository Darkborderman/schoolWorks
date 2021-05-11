#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>
#include <unistd.h>
int convert(char a);

static char encoding_table[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
                                'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
                                'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
                                'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f',
                                'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
                                'o', 'p', 'q', 'r', 's', 't', 'u', 'v',
                                'w', 'x', 'y', 'z', '0', '1', '2', '3',
                                '4', '5', '6', '7', '8', '9', '+', '/'};//encoding table of base64

int main(int argc, char **argv)
{

    char *ivalue=NULL;//set a value to save option i's argument
    char *ovalue=NULL;//set a value to save option o's argument
    int c;//set a value to catch option argument

    opterr = 0;

    while ((c = getopt (argc, argv, "i:o:")) != -1)//we could accept option i and option o
        switch (c)
        {
            case 'i':
                ivalue=optarg;//if argument is after i, save it in ivalue
                break;
            case 'o':
                ovalue=optarg;//if argument is after o, save it in ovalue
                break;
            case '?':
                printf("Unknown option: %c\n",(char)optopt);//if it have incorrect option, talk to user and end the program.
                return 1;
            default:
                abort ();
        }

    FILE *fp;
    FILE *fpo;
    char origin[1000]={0};// the array use to save original file.
    int hex[1000]={0};//the array use to save english word into integer.
    fp=fopen(ivalue,"r");//open option i argument
    fpo=fopen(ovalue,"w+");//creat an document which name is the same as option o's argument
    if(fp==NULL)//test if the document we opened is exist or not
    {
        printf("No file.\n");//if the file isn't exist, we would talk to user and end the program.
        return 1;
    }

    while((fscanf(fp,"%s",origin))!=EOF)//read origin file one line a time
    {
        for(int i=0;i<strlen(origin);i++) {
            hex[i]=convert(origin[i]);// change english word into number.
        }
        int SIZEorigin=(int)strlen(origin);//know the size of origin array.
        int SIZEhex=SIZEorigin;//size of hex array=size of origin array.
        int SIZEcon=(SIZEhex*2/3)+2;//size of final array,we plus 2 to incase there're less than 3 to convert.
        char convert[SIZEcon];//the final array.
        memset(convert,0,SIZEcon);//set the value in array to 0.
        int count;//how many number we converted.
        int re=0;//the number to record how many number we finished.
        for(count=0;count<SIZEcon-2;count=count+2)//we get 3 number in once and convert to 2 number in base64.
        {
            int real=0;//the value to calculate the sum of 3 number.
            for (int i=0;i<3;i++)
            {
                real=real+(int)(hex[re+i]*pow(16,2-i));//add number from right to left.
            }
            int	k=real%64;//convert then with 64,check the code by encoding table.
            convert[count+1]=encoding_table[k];
            real=real/64;
            convert[count]=encoding_table[real];

            re=re+3;
        }
        if(SIZEorigin%3==1)//if we have one word left, paddel two 0 (multiple4)
        {
            int real=hex[SIZEhex-1];
            real=real*4;
            convert[SIZEcon-2]=encoding_table[real];
            fprintf(fpo,"%s=\n",convert);
        }
        else if(SIZEorigin%3==2)//if we have two word left, paddel four 0 (multiple16) to make it be 12 .
        {
            int real=hex[SIZEhex-2]*16+hex[SIZEhex-1];
            real=real*16;
            int	r=real%64;
            convert[SIZEcon-2]=encoding_table[r];
            real=real/64;
            convert[SIZEcon-3]=encoding_table[real];
            fprintf(fpo,"%s==\n",convert);
        }
        else fprintf(fpo,"%s\n",convert);
    }
    fclose(fp);
    fclose(fpo);
    return 0;
}

int convert(char a)//encoding table of hex digit, let english word into number
{
    int r;
    switch(a){
        case'0':
            r=0;
            break;
        case'1':
            r=1;
            break;
        case'2':
            r=2;
            break;
        case'3':
            r=3;
            break;
        case'4':
            r=4;
            break;
        case'5':
            r=5;
            break;
        case'6':
            r=6;
            break;
        case'7':
            r=7;
            break;
        case'8':
            r=8;
            break;
        case'9':
            r=9;
            break;
        case'A':
            r=10;
            break;
        case'B':
            r=11;
            break;
        case'C':
            r=12;
            break;
        case'D':
            r=13;
            break;
        case'E':
            r=14;
            break;
        case'F':
            r=15;
            break;
        default:
            printf("INCORRECT WORD.\n");// if we find the word which is not in hex, print out and end the program
            return 1;
    }
    return r;
}