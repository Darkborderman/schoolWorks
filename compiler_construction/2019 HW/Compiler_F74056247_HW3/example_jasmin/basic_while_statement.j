; void main(){
;	 int a = 1;
;	 while (a < 6){
;		 print(a);
;		 a++;
;	 }
;	 return;
; }

.class public compiler_hw3
.super java/lang/Object
.method public static main([Ljava/lang/String;)V
.limit stack 50
.limit locals 50
	ldc 1
	istore 0
LABEL_BEGIN:
	iload 0
	ldc 6
	isub 
	iflt LABEL_TRUE
	goto LABEL_FALSE
LABEL_TRUE:
	iload 0
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(I)V
	iload 0
	ldc 1
	iadd
	istore 0
	goto LABEL_BEGIN
LABEL_FALSE:
	goto EXIT_0
EXIT_0:
	return
.end method
