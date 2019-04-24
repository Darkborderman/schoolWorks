.class public main
.super java/lang/Object
.method public static main([Ljava/lang/String;)V
	.limit stack 10
	.limit locals 10
ldc 45
ldc 52
iadd 
getstatic java/lang/System/out Ljava/io/PrintStream;
swap       ;swap the top two items on the stack 
invokevirtual java/io/PrintStream/println(I)V
ldc 65
ldc 92
iadd 
getstatic java/lang/System/out Ljava/io/PrintStream;
swap       ;swap the top two items on the stack 
invokevirtual java/io/PrintStream/println(I)V
ldc 9
ldc 52
imul 
getstatic java/lang/System/out Ljava/io/PrintStream;
swap       ;swap the top two items on the stack 
invokevirtual java/io/PrintStream/println(I)V
return
.end method
