#include <stdio.h>
#include <string.h>
#include <stdlib.h>

struct treenode{
    char phone[11];
    char name[21];
    int bf;
    struct treenode * ltree;
    struct treenode * rtree;
};//structure of AVL tree
typedef struct treenode node;
typedef node * nodeptr;
nodeptr getnode(char [],char []);
void insert(char [],char [],nodeptr *);
void search(char [],nodeptr *);
void preorder(nodeptr *);
void leftrotation(nodeptr *);
void rightrotation(nodeptr *);
int flag=0,recalculate=0;
nodeptr root=NULL;

int main() {
    char ptemp[11]="";
    char ntemp[21]="";//初始設定string為空字串
    char c1[]="S",c2[]="E";//比對字串，遇到S和E時需要改變動作
    scanf("%s",ntemp);//先讀入第一個輸入"D"，此時並不用做任何事
    while(scanf("%s",ntemp)!=EOF){
        if(strcmp(ntemp,c1)==0)//讀入下一個輸入，觀察他是否為"S"，不是的話就是名字，是的話則結束該迴圈
            break;
        scanf("%s",ptemp);//讀入電話號碼
        insert(ntemp,ptemp,&root);//用名字和電話號碼建立node並insert進AVL tree
    }
    preorder(&root);//遇到"S"代表結束輸入，在開始搜尋前先使用pre-order printout 所有名字
    while(scanf("%s",ntemp)!=EOF){
        if(strcmp(ntemp,c2)==0)//讀入字串，如果是"E"則結束迴圈，不是則代表字串為名字
            break;
        puts("");
        search(ntemp,&root);//使用名字搜尋
    }
    return 0;
}
nodeptr getnode(char user[],char num[])
{
    nodeptr newptr=malloc(sizeof(node));
    strcpy(newptr->name,user);//複製user裡面的內容給newptr指向的phone
    strcpy(newptr->phone,num);
    newptr->ltree=NULL;
    newptr->rtree=NULL;
    newptr->bf=0;//新安插的treenode bf值均為0，因為是leaf node
    return newptr;//malloc成功並初始化後回傳
}
void insert(char user[],char num[],nodeptr *parent)
{
    if(*parent==NULL) {//如果node下面沒有其他數，便可以安插新的資料
        recalculate=1;//此時有部分node的bf需重新計算
        nodeptr newnode=getnode(user, num);
        *parent=newnode;
    }
    if(strcmp(user,(*parent)->name)>0){//若想安插的資料之字典順序大於該node，往右邊探尋
        insert(user,num,&((*parent)->rtree));
        if(recalculate==1){//安插完後要來調整
            switch((*parent)->bf){
                case 1://原本是左邊比較低，右邊插入後便一樣高
                    (*parent)->bf=0;
                    recalculate=0;
                    break;
                case 0://原本是一樣高，右邊插入後右邊低一層(lf-rf=-1)
                    (*parent)->bf=-1;
                    break;
                case -1://原本是右邊低，右邊插入後低兩層
                    rightrotation(parent);//此時需要做right rotation
                    break;
            }
        }
        }
    if(strcmp(user,(*parent)->name)<0){//若想安插的資料之字典順序小於該node，往左邊探尋
        insert(user,num,&((*parent)->ltree));
        if(recalculate==1){//安插完後要來調整
            switch((*parent)->bf){
                case -1://原本是右邊比較低，左邊插入後便一樣高
                    (*parent)->bf=0;
                    recalculate=0;
                    break;
                case 0://原本是一樣高，左邊插入後左邊低一層(lf-rf=1)
                    (*parent)->bf=1;
                    break;
                case 1://原本是左邊低，右邊插入後低兩層
                    leftrotation(parent);//此時需要做left rotation
                    break;
            }
        }
    }
    if(strcmp(user,(*parent)->name)==0);//如果資料是已經插入過的，不需要做任何事
}
void search(char compare[],nodeptr *now)
{
    if(*now)
    {
        if(strcmp(compare,(*now)->name)==0)//如果找尋的東西就是該node，列印
            printf("%s %s",compare,(*now)->phone);
        if(strcmp(compare,(*now)->name)>0)//如果找尋的東西在字典裡比該node大，往右邊找
            search(compare,&((*now)->rtree));
        if(strcmp(compare,(*now)->name)<0)//如果找尋的東西在字典裡比該node小，往左邊找
            search(compare,&((*now)->ltree));
    }
    if((*now)==NULL) printf("%s null",compare);//如果找不到東西，印出名字，但電話印"null"
}
void preorder(nodeptr *now)
{
    if(*now)
    {
        if(flag==0)//如果一開始還沒印出任何東西過，直接印資料並將flag變1
        {
            printf("%s",(*now)->name);
            flag=1;
        }
        else printf(" %s",(*now)->name);//如果印過東西了，在每次印東西前先加空白
        preorder(&((*now)->ltree));//印完當前的東西，往左子樹走
        preorder(&((*now)->rtree));//走了左子樹換走右子樹
    }
}
void leftrotation(nodeptr *parent)
{
    nodeptr grandchild,child;
    child=(*parent)->ltree;//左邊要旋轉，所以要討論的child為parent的左邊
    if(child->bf==1){//檢查發生+2的node的lchild的bf，若是+1則為LL，若是-1則為LR
        (*parent)->ltree=child->rtree;//child會被提上去，其右邊既要在child的右邊，又要在parent的左邊，所以parent的ltree會接它
        child->rtree=*parent;//而child的rtree接parent
        (*parent)->bf=0;//如此修正，原本發生+2的node則變得左右平衡，bf=0
        (*parent)=child;//原本的parent被child取代
    }
    else{
        grandchild=child->rtree;//不論是LL或LR，child相對於parent的位置都一樣，而在LR中，grandchild為parent的左邊的右邊
        child->rtree=grandchild->ltree;//grandchild會被提上去，其左子樹要在grandchild的左邊，也要在child的右邊，所以child的rtree會接住
        grandchild->ltree=child;//這樣grandchild的左邊就可以接child
        (*parent)->ltree=grandchild->rtree;//grandchild的右子樹要在grandchild的右邊，又會比parent小，所以它會在parent的左邊
        grandchild->rtree=*parent;//grandchild的右邊接parent
        switch(grandchild->bf){//重新計算bf
            case 1://如果grandchild下面是左邊低，則parent所接的rf會導致右邊低；而child則兩邊等高
                (*parent)->bf=-1;
                child->bf=0;
                break;
            case 0://如果grandchild=0，代表下面是平衡的，分給parent和child後兩個居兩邊等高
                (*parent)->bf=child->bf=0;
                break;
            case -1://如果grandchild下面是右邊低，則child所接的lf會導致左邊低；而parent則兩邊等高
                (*parent)->bf=0;
                child->bf=1;
                break;
        }
        *parent=grandchild;//變成grandchile在正中間了
    }
    (*parent)->bf=recalculate=0;//最後parent的bf一定都是0，並且因為調整過了所以整棵樹可以達到平衡
}
void rightrotation(nodeptr *parent)
{
    nodeptr grandchild,child;
    child=(*parent)->rtree;//右邊要旋轉，所以要討論的child為parent的右邊
    if(child->bf==-1){//檢查發生+2的node的lchild的bf，若是-1則為RR，若是+1則為RL
        (*parent)->rtree=child->ltree;//child會被提上去，其左邊既要在child的左邊，又要在parent的右邊，所以parent的rtree會接它
        child->ltree=*parent;//而child的ltree接parent
        (*parent)->bf=0;//如此修正，原本發生-2的node則變得左右平衡，bf=0
        (*parent)=child;
    }
    else{
        grandchild=child->ltree;//不論是RR或RL，child相對於parent的位置都一樣，而在RL中，grandchild為parent的右邊的左邊
        child->ltree=grandchild->rtree;//grandchild會被提上去，其右子樹要在grandchild的右邊，也要在child的左邊，所以child的ltree會接住
        grandchild->rtree=child;//這樣grandchild的右邊就可以接child
        (*parent)->rtree=grandchild->ltree;//grandchild的左子樹要在grandchild的左邊，又會比parent大，所以它會在parent的右邊
        grandchild->ltree=*parent;//grandchild的左邊接parent
        switch (grandchild->bf) {//重新計算bf
            case 1:
                (*parent)->bf=0;
                child->bf=-1;
                break;
            case 0:
                (*parent)->bf=child->bf=0;
                break;
            case -1:
                (*parent)->bf=1;
                child->bf=0;
                break;
        }
        *parent=grandchild;//grandchile在正中間
    }
    (*parent)->bf=recalculate=0;//最後parent的bf一定都是0，並且因為調整過了所以整棵樹可以達到平衡
}