; void main(){
; 	 int a = 20;
;	 if (a == 40){
;		 print("a is equal to 40");
;	 }
;	 else if (a > 40){
; 	 	 print("a is larger than 40");
;	 }
;	 else{
;		 print(666);
;	 }
;
;	 return;
; }

.class public compiler_hw3
.super java/lang/Object
.method public static main([Ljava/lang/String;)V
.limit stack 50
.limit locals 50
	ldc 20
	istore 0
	iload 0
	ldc 40
	isub
	ifeq LABEL_EQ
	iload 0
	ldc 40
	isub
	ifgt LABEL_GT
	ldc 666
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(I)V
	goto EXIT_0
LABEL_EQ:
	ldc "a is equal to 40"
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	goto EXIT_0
LABEL_GT:
	ldc "a is larger to 40"
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	goto EXIT_0
EXIT_0:
	return	
.end method
