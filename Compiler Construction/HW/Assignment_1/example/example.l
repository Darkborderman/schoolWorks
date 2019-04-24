%{ 
	#include <stdio.h> 
	#include <stdlib.h> 
	#include <ctype.h> 
%} 
 
letter 	[a-zA-Z] 
digit 	[0-9] 
id 		{letter}+({letter}|{digit})* 
number  {digit}+ 
 
%% 
 
";"     {printf("%s is a sem \n",yytext); } 
{id}     {printf("%s is a ID \n",yytext); } 
{digit}+   {printf("%s is a number \n",yytext);} 
"="     {printf("%s is an assign \n",yytext);} 
"+"     {printf("%s is a operator \n",yytext);} 
[\n]    {} 
 
%% 
 
int main(int argc,char *argv[]){ 
 
	yyin = fopen(argv[1],"r");  
	yylex();
	return 0; 
} 
 
int yywrap(void) {     
	return 1; 
} 