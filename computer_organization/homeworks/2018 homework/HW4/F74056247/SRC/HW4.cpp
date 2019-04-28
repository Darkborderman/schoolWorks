#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<fstream>
#include<vector>
#include<map>
#include<string>
#include<cstring>

using namespace std;

fstream loadFile(int argc,char* argv[]);
fstream writeFile(int argc,char* argv[]);

class block{
    public:
        bool vaild;
        long offset;
        int access;
        block(int offset){
            this->vaild=false;
            this->offset=offset;
            this->access=0;
        }
        block(){
            this->vaild=false;
        }
};

int main(int argc,char *argv[]){

    fstream source=loadFile(argc,argv);
    fstream target=writeFile(argc,argv);
    if(!source){
        cout<<"error, no file"<<endl;
        return 1;
    }

    int cacheSize;
    int blockSize;
    int associativity;
    int replacement;
    int missCount=0;
    int hitCount=0;
    int blockNumber=0;
    vector<bool> operation;
    map<long,block> cache;

    source>>cacheSize;
    source>>blockSize;
    source>>associativity;
    source>>replacement;

    long temp;
    while(source>>hex>>temp)
    {
        
        auto it=cache.find(temp/32);
        if(it==cache.end()) //cache miss
        {
            if(blockNumber==cacheSize*1024/blockSize)
            {
                if(replacement==0) //fifo
                {
                    cache.erase(cache.begin());
                    blockNumber--;
                }
                if(replacement==1) //LRU
                {
                    int LRU=INT_LEAST32_MAX;
                    map<long,block>::iterator index;
                    
                    for(map<long,block>::iterator i=cache.begin();i!=cache.end();i++)
                    {
                        block temp=i->second;
                        if(temp.access<LRU)
                        {
                            LRU=temp.access;
                            index=i;
                        }
                    }
                    cache.erase(index);
                    blockNumber--;
                }
            }
            
            missCount++;
            block x;
            x.vaild=true;
            x.offset=temp%blockSize;
            cache[temp/blockSize]=x;
            blockNumber++;
            operation.push_back(false);
        }
        else{
            hitCount++;
            block x;
            x=cache.at(temp/blockSize);
            x.offset=temp%blockSize;
            x.access++;
            cache[temp/blockSize]=x;
            operation.push_back(true);
        }
    }
    /*
    cout<<cacheSize<<endl;
    cout<<blockSize<<endl;
    cout<<cacheSize*1024/blockSize<<endl;
    cout<<associativity<<endl;
    cout<<replacement<<endl;
    */
    
    //cout<<"Hits instructions: ";
    target<<"Hits instructions: ";
    for(int i=0,counter=0;i<=operation.size()-1;i++)
    {
        if(operation.at(i)==true){
            //cout<<i+1;
            target<<i+1;
            counter++;
            if(counter<hitCount){
                //cout<<",";
                target<<",";
            } 
        } 
    }
    //cout<<endl<<"Misses instructions: ";
    target<<endl<<"Misses instructions: ";
    for(int i=0,counter=0;i<=operation.size()-1;i++)
    {
        if(operation.at(i)==false){
            //cout<<i+1;
            target<<i+1;
            counter++;
            if(counter<missCount){
                //cout<<",";
                target<<",";
            }
        } 
    }
    
    //cout<<endl<<"Miss rate: ";
    //cout<<(double)missCount/(hitCount+missCount)<<endl;
    target<<endl<<"Miss rate: ";
    target<<(double)missCount/(hitCount+missCount)<<endl;

    return 0;
}

fstream loadFile(int argc,char* argv[]){

    string input;
    fstream file;

    for(int i=0;i<=argc-1;i++)
    {
        if(((string)argv[i]=="-input"||(string)argv[i]=="--input")&&argv[i+1]!=NULL)
        {
            input=argv[i+1];
        }
    }

    file.open(input,ios::in);
    return file;
}

fstream writeFile(int argc,char* argv[]){

    string output;
    fstream file;
    string folder="";

    for(int i=0;i<=argc-1;i++)
    {

        if((string)argv[i]=="-output"||(string)argv[i]=="--output"&&argv[i+1]!=NULL)
        {

            char *pch=strtok(argv[i+1],"/");
            output=pch;
            pch=strtok(NULL,"/");
            while(pch!=NULL)
            {
                folder=folder+output+"/";
                output=pch;
                pch=strtok(NULL,"/");
            }
            string temp="touch "+folder+output;
            string temp2="mkdir "+folder+" -p";
            
            if(folder!=""&&folder!="./") system(temp2.c_str());
            system(temp.c_str());

        }
    }

    file.open(folder+output,ios::out|ios::trunc);
    return file;
}