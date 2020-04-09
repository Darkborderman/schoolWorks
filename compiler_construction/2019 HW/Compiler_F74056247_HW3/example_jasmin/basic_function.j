; int foo(int a) {
;    a += 6;
;	 return a;
; }
;
; void lol(int a) {
;     print(a);
;	  return;
; }
;
;
; void main(){
; 	 int a;
;	 a = foo(4);
;    lol(a);
; 	 return;
; }

.class public compiler_hw3
.super java/lang/Object
.method public static foo(I)I
.limit stack 50
.limit locals 50
	iload 0
	ldc 4
	iadd
	istore 0
	iload 0
	ireturn
.end method
.method public static lol(I)V
.limit stack 50
.limit locals 50
	iload 0
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(I)V
	return
.end method
.method public static main([Ljava/lang/String;)V
.limit stack 50
.limit locals 50
	ldc 0
	istore 0
	ldc 6
	invokestatic compiler_hw3/foo(I)I
	istore 0
	iload 0
	invokestatic compiler_hw3/lol(I)V
	return
.end method
