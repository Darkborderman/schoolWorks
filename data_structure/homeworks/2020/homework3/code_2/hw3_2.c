#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>

struct queue
{
    int data;
    struct queue* next;
};
typedef struct queue queue;
typedef queue * queueptr;

void enqueue(int);
void dequeue();
queueptr getnewqueue(int);
void printqueue();
bool IsEmpty(queueptr);
int card[14]={'A','2','3','4','5','6','7','8','9',10,'J','Q','K'};
queueptr Chead=NULL;
queueptr Ctail=NULL;

int main(){
    char record[10];
    int value;
    while(scanf("%s",record)!=EOF)
    {
       value=record[0];
        if((int)value==49)
        {
            enqueue(10);
        }
       else if((int)value=='A'||(int)value=='2'||(int)value=='3'||(int)value=='4'||(int)value=='5'||(int)value=='6'||(int)value=='7'||(int)value=='8'||(int)value=='9'||(int)value=='J'||(int)value=='Q'||(int)value=='K')
           enqueue(value);
   }
    int count=0,c=0;
    do {
        value=Chead->data;
        if(c!=0)
            printf("\n");
        if(value==card[12-count])
        {
            printqueue();
            dequeue();
            count=count+1;
        }
        else
        {
            printqueue();
            dequeue();
            enqueue(value);
        }
        c++;
    }while(count<13);
    return 0;
}
void enqueue(int item)
{
    queueptr newptr=getnewqueue(item);
    if(newptr==NULL)
    {
        printf("no space to enqueue\n");
        exit(0);
    }
    if(IsEmpty(Chead))
        Chead=newptr;
    else
        Ctail->next=newptr;
    Ctail=newptr;

}
queueptr getnewqueue(int data)
{
    queueptr newptr=(queueptr)malloc(sizeof(queueptr));
    if(newptr!=NULL)
    {
        newptr->data=data;
        newptr->next=NULL;
    }
    return newptr;
}
bool IsEmpty(queueptr head)
{
    return head==NULL;
}
void dequeue()
{
    if(IsEmpty(Chead))
    {
        printf("queue is empty.\n");
    }
    else
    {
        queueptr tempptr=Chead;
        Chead=Chead->next;
        free(tempptr);
    }
}
void printqueue()
{
    queueptr tempptr=Chead;
    do
    {
        if(tempptr->next==NULL)
        {
            if(tempptr->data==10)
                printf("%d",tempptr->data);
            else
                printf("%c",tempptr->data);
        }
        else
        {
            if(tempptr->data == 10)
                printf("%d ", tempptr->data);
            else
                printf("%c ", tempptr->data);
        }
        tempptr=tempptr->next;
    }while(tempptr!=NULL);
}