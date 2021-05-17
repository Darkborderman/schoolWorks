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

int re;
bool IsEmptyS(stackPtr);
bool IsEmptyQ(queuePtr);
stackPtr getNewStack(int);
queuePtr getNewQueue(int);
void pushStack(int,stackPtr *);
void popStack(int *,stackPtr *);
void enqueue(int ,queuePtr *,queuePtr *);
void dequeue(queuePtr *);

FILE *fpi;

int main() {

    fpi = freopen("input.txt", "r",stdin);

    stackPtr stacktop = NULL;
    queuePtr Ahead = NULL;
    queuePtr Atail = NULL;
    queuePtr Bhead = NULL;
    queuePtr Btail = NULL;

    char str[20]={0};
    int num;
    char aORb;
       while (scanf("%s",str) != EOF)
    {
        if (strncmp(str,"PUSH",4)==0)
        {
            fscanf("%s",str);
            num=atoi(str);
            pushStack(num, &stacktop);
        }
        else if (strncmp(str,"POP",3)==0)
        {
            popStack(&re, &stacktop);
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
                    fprintf(stderr,"INCORECCT QUEUE.");
                    break;
            }
         }
        else if(strncmp(str,"ENQUEUE",7)==0)
        {
            scanf("%s",&aORb);
            switch (aORb)
            {
                case 'A':
                     enqueue(re,&Atail,&Ahead);
                     break;
                case 'B':
                     enqueue(re, &Btail,&Bhead);
                     break;
                default:
                     fprintf(stderr,"INCORECCT QUEUE.");
                     break;
            }
        }
        else fprintf(stderr,"Undefined command.");
    }

   fclose(fpi);


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
        fprintf(stderr,"WRONG");
       else
    {
           newPtr->nextptr=*sptr;
           *sptr=newPtr;
    }
}

void popStack(int *record,stackPtr *Sptr)
{
     if(IsEmptyS(*Sptr))
         fprintf(stderr,"Stack is empty.");
     else
    {
         stackPtr tempPtr=*Sptr;
         *record=(*Sptr)->index;
         *Sptr=(*Sptr)->nextptr;
         free(tempPtr);
    }
}

void enqueue(int record,queuePtr *Qtail,queuePtr *Qhead)
{
     queuePtr newPtr=getNewQueue(record);
     if(newPtr==NULL)
         fprintf(stderr,"WRONG");
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
     if(IsEmptyQ(*Qhead))
     {
         fprintf(stderr,"queue is empty.");
     }
     else
     {
         queuePtr tempPtr=*Qhead;
         *Qhead=( *Qhead )->nextptr;
         fprintf(stderr,"%d\n",tempPtr->plateIndex);
         free(tempPtr);
     }
}