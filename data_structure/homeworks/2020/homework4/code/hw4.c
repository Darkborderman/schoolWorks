#include <stdio.h>
#include<stdlib.h>
#include<stdbool.h>

struct bintreeNode{
    int data;
    struct bintreeNode* left;
    struct bintreeNode* right;
};
struct queueNode
{
    struct bintreeNode* node;
    struct queueNode* next;
};
typedef struct bintreeNode bintree;
typedef bintree * treeptr;
typedef struct queueNode queue;
typedef queue * qptr;

void enq(treeptr);
void deq();
qptr getnewq(treeptr);
bool IsEmpty(qptr);
qptr Qhead=NULL;
qptr Qtail=NULL;

void insert(int,treeptr *);
treeptr getnewN(int);
treeptr delete(int,treeptr *);
void levelOrder(treeptr);
int firstline=1;
treeptr root=NULL;

int main() {
    int num=0;
    char temp;
    while(scanf("%c",&temp)!=EOF)
    {
      if(temp=='\n')
      {
          insert(num,&root);//最後一個數後面會直接接換行，記得要讓最後一個數也insert
          break;
      }
      if(temp==' ')
      {
          insert(num,&root);
          num=0;
      }
      else
      {
          num=num*10+(temp-'0');
      }
    }
    while(scanf("%d",&num)!=EOF)
    {
        root=delete(num,&root);
    }
    levelOrder(root);
    return 0;
}
treeptr getnewN(int item)
{
    treeptr newptr=malloc(sizeof(bintree));
    if(newptr!=NULL)
    {
        newptr->data=item;
        newptr->left=NULL;
        newptr->right=NULL;
    }
    return newptr;
}
void insert(int item,treeptr *current)
{
    if(*current==NULL)
    {
        treeptr newptr=getnewN(item);
        if(newptr==NULL) printf("No space to insert tree.\n");
        else *current=newptr;
    }
    if(item<(*current)->data)
    {
        insert(item,&((*current)->left));
    }
    if(item>(*current)->data)
    {
        insert(item,&((*current)->right));
    }
}
treeptr delete(int item,treeptr *current)
{
    if((*current)==NULL)//當他發現它啥都找不到的時候，不要動回傳回去
        return NULL;
    if(item>(*current)->data)
    {
        (*current)->right=delete(item,&((*current)->right));//如果要刪除的數比所在的大，往它的右邊找
    }
    else if(item<(*current)->data)
    {
        (*current)->left=delete(item,&((*current)->left));//如果要刪除的比所在的小，往左邊找
    }
    else//要刪除的數跟所在一樣大
    {
        if((*current)->left==NULL)//如果所在的左邊為空，就把右邊的記起來，之後右邊的就會接到上一層了(如果右邊為空也會記起來，就是沒有child的意思，只有左邊空的話，是一個child的意思)
        {
            treeptr temp=(*current)->right;
            free(*current);
            return temp;
        }
        else if((*current)->right==NULL)//如果左邊不是空的，就記著左邊，讓左邊跟上一層接起來(一個child)
        {
            treeptr temp=(*current)->left;
            free(*current);
            return temp;
        }
        treeptr temp=(*current)->right;//確定有兩個child了，先進去右邊子樹
        while(temp&&temp->left!=NULL)
        {
            temp=temp->left;//讓最小變成當前的左邊
        }
        (*current)->data=temp->data;//最後把找到的最小值跟要刪除的值換
        (*current)->right=delete(temp->data,&((*current)->right));//然後準備把最小的刪掉，因為它會從它的右邊開始找，最後找到替換的樹，然後讓它的下面往上接或是讓它指向空的
    }
    return (*current);//在delete做完之後，負責把值歸還回去
}
void enq(treeptr item)
{
    qptr newptr=getnewq(item);
    if(newptr==NULL) printf("no space to enqueue\n");
    if(IsEmpty(Qhead)) Qhead=newptr;
    else Qtail->next=newptr;
    Qtail=newptr;
}
qptr getnewq(treeptr data)
{
    qptr newptr=malloc(sizeof(qptr));
    if(newptr!=NULL)
    {
        newptr->node=data;
        newptr->next=NULL;
    }
    return newptr;
}
bool IsEmpty(qptr head)
{
    return head==NULL;
}
void deq()
{
    if(IsEmpty(Qhead)) printf("queue is empty.\n");
    else
    {
        qptr tempptr=Qhead;
        Qhead=Qhead->next;
        if(firstline) firstline=0;
        else puts("");
        printf("%d",tempptr->node->data);
        free(tempptr);
    }
}
void levelOrder(treeptr begin)
{
    treeptr current=begin;//先把一開始傳入的位置，通常是root放在紀錄點
    enq(current);//enqueue一開始的東西
    while(!IsEmpty(Qhead))
    {
        current=Qhead->node;
        deq();
        if(current->left!=NULL) enq(current->left);
        if(current->right!=NULL) enq(current->right);
    }//如果queue沒空，dequeue一個東西，並看那個東西有沒有左右child，有的話把child enqueue進去
}