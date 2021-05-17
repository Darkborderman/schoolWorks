#include <stdio.h>
#include <stdlib.h>
#define MAX 100

typedef struct node{
    int e,l,num;
}node;
typedef struct edge{
    node *start,*end;
    int weight,name;
    struct edge *nextlink;
}edge;
typedef edge * eptr;
typedef struct list{
    edge *link;
    int count;
}list;

int end_p,flag=0;
eptr get_edge(int e_name,int s,int f,int w,node v[])
{
    eptr tptr=malloc(sizeof(edge));
    tptr->weight=w;
    tptr->start=&v[s];
    tptr->end=&v[f];
    tptr->nextlink=NULL;
    tptr->name=e_name;
    return tptr;
}
void read_data(int e_num, list early[],list late[],node v[]) {
    for (int i = 0; i < MAX; i++) {//initialize some element
        early[i].count =late[i].count= v[i].e = 0;
        early[i].link = late[i].link = NULL;
        v[i].num = i;
    }
    for (int i = 0; i<e_num; i++) {
        int edg, s, f, w;
        scanf("%d%d%d%d", &edg, &s, &f, &w);
        {
            eptr tptr = get_edge(edg, s, f, w, v);//do a early point list
            early[f].count++;
            if (early[s].link == NULL)
                early[s].link = tptr;
            else {
                eptr now = early[s].link;
                while (now->nextlink != NULL) now = now->nextlink;
                now->nextlink = tptr;
            }
        }
        {
            eptr tptr = get_edge(edg, f, s, w, v);//do a late point list
            late[s].count++;
            if (late[f].link == NULL)
                late[f].link = tptr;
            else {
                eptr now = late[f].link;
                while (now->nextlink != NULL) now = now->nextlink;
                now->nextlink = tptr;
            }
        }
        end_p = f;//calculate maximum point, 因為它會照順序
    }
}
void calculate_early(list early[],int s[],int top,node v[])
{
    s[top]=0,top++;
    while(top>0)
    {
        int now=s[top-1];
        top--;
        eptr nptr=early[now].link;
        while(nptr!=NULL)
        {
            int point=nptr->end->num;
            if(nptr->end->e>(nptr->weight)+(v[now].e));//如果原本的比較大，就不要動
            else nptr->end->e=(nptr->weight)+(v[now].e);//不然就換新的值
            if(early[point].count>1) early[point].count--;
            else s[top]=point,top++;
            nptr=nptr->nextlink;
        }
    }
}
void calculate_late(list late[],int s[],int top,node v[])
{
    for(int i=0;i<=end_p;i++) v[i].l=v[end_p].e;//先把每個都重製成
    s[top]=end_p,top++;
    while(top>0)
    {
        int now=s[top-1];
        top--;
        eptr nptr=late[now].link;
        while(nptr!=NULL)
        {
            int point=nptr->end->num;
            if(nptr->end->l<(v[now].l)-(nptr->weight));
            else nptr->end->l=(v[now].l)-(nptr->weight);
            if(late[point].count>1) late[point].count--;
            else s[top]=point,top++;
            nptr=nptr->nextlink;
        }
    }
}
void critical_e(list early[],int e_num)
{
    int c_e[MAX]={0};
    edge all_edge[MAX];
    for(int i=0;i<end_p;i++)
    {
        eptr nptr=early[i].link;
        while(nptr!=NULL)
        {
            int index=nptr->name;
            all_edge[index]=*nptr;
            nptr=nptr->nextlink;
        }
    }
    for(int i=0;i<e_num;i++)
     {
        int early,late;
        early=all_edge[i].start->e;
        late=(all_edge[i].end->l)-(all_edge[i].weight);
        printf("%d ",i);
        printf("%d ",early);
        printf("%d",late);
        puts("");
        if(early==late) c_e[i]=1;
        else c_e[i]=0;
     }
    for(int i=0;i<e_num;i++)
    {
        if(c_e[i])
        {
            if(flag)
                printf(" %d",i);
            else
            {
                flag=1;
                printf("%d",i);
            }
        }
    }
}
int main() {
    int e_num;
    list early[MAX],late[MAX];
    node v[MAX];
    scanf("%d",&e_num);
    read_data(e_num,early,late,v);
    int stack[MAX]={-1},top=0;
    calculate_early(early,stack,top,v);
    calculate_late(late,stack,top,v);
    critical_e(early,e_num);
    return 0;
}