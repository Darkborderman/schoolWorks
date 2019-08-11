.class public compiler_hw3
.super java/lang/Object
.field public static global I = 10
.method public static foo()I
.limit stack 50
.limit locals 50
ldc 10
istore 0
iload 0
getstatic java/lang/System/out Ljava/io/PrintStream;
swap
invokevirtual java/io/PrintStream/println(I)V
ldc "fuck"
getstatic java/lang/System/out Ljava/io/PrintStream;
swap
invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
iload 0
ireturn
.end method
.method public static main([Ljava/lang/String;)V
.limit stack 50
.limit locals 50
ldc 10
istore 0
iload 0
iadd
istore 0
invokestatic compiler_hw3/foo()I
ldc 10
istore 1
iload 0
getstatic java/lang/System/out Ljava/io/PrintStream;
swap
invokevirtual java/io/PrintStream/println(I)V
return
.end method
