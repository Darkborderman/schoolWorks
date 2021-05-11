#include <stdio.h>
#define TABLE_SIZE 13
#define PRIME 7

int main() {
    int key,check[TABLE_SIZE]={0},hash[TABLE_SIZE]={0};
    while(scanf("%d",&key)!=EOF)
    {
        int temp=key%TABLE_SIZE;
        if(check[temp]==0)
        {
            hash[temp]=key;
            check[temp]=1;
            continue;
        }
        do{
            temp=(temp+PRIME-(key%PRIME))%TABLE_SIZE;
        }while (check[temp]==1);
        hash[temp]=key;
        check[temp]=1;
    }
    printf("%d->%d",0,hash[0]);
    for(int i=1;i<TABLE_SIZE;i++)
    {
        puts("");
        printf("%d->%d",i,hash[i]);
    }
    return 0;
}
