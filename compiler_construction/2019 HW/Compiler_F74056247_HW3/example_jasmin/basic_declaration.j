.class public compiler_hw3
.super java/lang/Object
.field public static a I = 6
.field public static b I
.method public static main([Ljava/lang/String;)V
.limit stack 50
.limit locals 50
ldc 0
istore 0
getstatic compiler_hw3/a I
ldc 6
iadd
istore 0
iload 0
getstatic java/lang/System/out Ljava/io/PrintStream;
swap
invokevirtual java/io/PrintStream/println(I)V
return
.end method
