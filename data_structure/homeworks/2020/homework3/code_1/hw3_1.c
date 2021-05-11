#include <stdio.h>
#include<stdlib.h>
#include<string.h>
#include<stdbool.h>

struct stackNode
{
    int index;
    struct stackNode* nextptr;
};

struct queueNode
{
    int plateIndex;
    struct queueNode* nextptr;
};

typedef struct stackNode stack;
typedef struct queueNode queue;
typedef stack * stackPtr;
typedef queue * queuePtr;

int re,count;
bool IsEmptyS(stackPtr);
bool IsEmptyQ(queuePtr);
stackPtr getNewStack(int);
queuePtr getNewQueue(int);
void pushStack(int,stackPtr *);
void popStack(stackPtr *);
void enqueue(queuePtr *,queuePtr *);
void dequeue(queuePtr *);
int main() {
    stackPtr stacktop = NULL;
    queuePtr Ahead = NULL;
    queuePtr Atail = NULL;
    queuePtr Bhead = NULL;
    queuePtr Btail = NULL;

    char str[20]={0};
    int num;
    char aORb;
    count=0;
       while (scanf("%s",str) != EOF)
    {
        if (strncmp(str,"PUSH",4)==0)
        {
            scanf("%s",str);
            num=atoi(str);
            pushStack(num, &stacktop);
        }
        else if (strncmp(str,"POP",3)==0)
        {
            popStack(&stacktop);
        }
        else if (strncmp(str,"DEQUEUE",7)==0)
         {
            scanf("%s",&aORb);
            switch (aORb)
            {
                case 'A':
                    dequeue(&Ahead);
                    break;
                case 'B':
                    dequeue(&Bhead);
                    break;
                default:
                    break;
            }
         }
        else if(strncmp(str,"ENQUEUE",7)==0)
        {
            scanf("%s",&aORb);
            switch (aORb)
            {
                case 'A':
                     enqueue(&Atail,&Ahead);
                     break;
                case 'B':
                     enqueue(&Btail,&Bhead);
                     break;
                default:
                     break;
            }
        }
    }
    return 0;
}

bool IsEmptyS(stackPtr top)
{
        return top==NULL;
}

bool IsEmptyQ(queuePtr head)
{
        return head==NULL;
}

stackPtr getNewStack(int value)
{
    stackPtr newPtr = (stackPtr) malloc(sizeof(stack));
    if ( newPtr != NULL )
    {
        newPtr->index = value;
        newPtr->nextptr = NULL;
    }
    return newPtr;
}
queuePtr getNewQueue(int value)
{
    queuePtr newptr=(queuePtr) malloc(sizeof(queue));
    if(newptr!=NULL)
    {
        newptr->plateIndex=value;
        newptr->nextptr=NULL;
    }
    return newptr;
}
 void pushStack(int val,stackPtr *sptr)
{
       stackPtr newPtr = getNewStack(val);
       if (newPtr==NULL)
        printf("WRONG, no space to push.\n");
       else
    {
           newPtr->nextptr=*sptr;
           *sptr=newPtr;
    }
}
void popStack(stackPtr *Sptr)
{
     if(IsEmptyS(*Sptr));
     else
    {
         stackPtr tempPtr=*Sptr;
         re=(*Sptr)->index;
         *Sptr=(*Sptr)->nextptr;
         free(tempPtr);
    }
}
void enqueue(queuePtr *Qtail,queuePtr *Qhead)
{
     queuePtr newPtr=getNewQueue(re);
     if(newPtr==NULL)
         printf("WRONG, no space to enqueue.\n");
     if(IsEmptyQ(*Qhead))
     {
         *Qhead=newPtr;
     }
     else
     {

         (*Qtail)->nextptr=newPtr;
     }
         *Qtail=newPtr;

}
void dequeue(queuePtr *Qhead)
{
     if(IsEmptyQ(*Qhead));
     else if(count==0)
     {
         queuePtr tempPtr=*Qhead;
         *Qhead=( *Qhead )->nextptr;
         printf("%d",tempPtr->plateIndex);
         free(tempPtr);
         count++;
     }
     else
     {
         printf("\r\n");
         queuePtr tempPtr=*Qhead;
         *Qhead=( *Qhead )->nextptr;
         printf("%d",tempPtr->plateIndex+0);
         free(tempPtr);
         count++;
     }
}
