.class public main
.super java/lang/Object
.method public static main([Ljava/lang/String;)V
.limit stack 30
.limit locals 20
	ldc 10
	istore 0
	iload 0
	ldc 10
	ldc 2
	idiv
	if_icmpgt Label_00
	iload 0
	ldc 0
	if_icmple Label_10
	ldc 6
	istore 0
	goto EXIT_10
Label_10 : 
	iload 0
	ldc 8
	if_icmpne Label_11
	ldc 2
	istore 0
	goto EXIT_10
Label_11 : 
	ldc 13
	istore 0
EXIT_10 : 
	goto EXIT_00
Label_00 : 
	iload 0
	ldc 10
	if_icmpge Label_01
	iload 0
	ldc 0
	if_icmple Label_12
	ldc 5
	istore 0
	goto EXIT_11
Label_12 : 
	iload 0
	ldc 8
	if_icmpne Label_13
	ldc 1
	istore 0
	goto EXIT_11
Label_13 : 
	ldc 12
	istore 0
EXIT_11 : 
	goto EXIT_00
Label_01 : 
	iload 0
	ldc 9
	if_icmpne Label_02
	ldc 20
	istore 0
	goto EXIT_00
Label_02 : 
	ldc 100
	istore 0
EXIT_00 : 
	iload 0
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(I)V
	ldc 5.500000
	ldc 55
	ldc 10
	idiv
	i2f
	fcmpl
	ifle Label_03
	ldc "5.5 > 55 / 10 is True"
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
Label_03 : 
EXIT_01 : 
	ldc 55
	ldc 10
	idiv
	i2f
	ldc 2.200000
	fcmpl
	ifge Label_04
	ldc "True"
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	goto EXIT_02
Label_04 : 
	ldc 2.200000
	ldc 1.200000
	fcmpl
	ifgt Label_05
	ldc "2.2<=1.2 is True"
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	goto EXIT_02
Label_05 : 
	ldc 2.200000
	ldc 10
	i2f
	fcmpl
	ifne Label_06
	ldc "2.2==1.2 is True"
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	goto EXIT_02
Label_06 : 
	ldc 5.500000
	ldc 55
	ldc 10
	idiv
	i2f
	fcmpl
	ifgt Label_07
	ldc "5.5 <= 55/10 is True"
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	goto EXIT_02
Label_07 : 
	ldc 2.200000
	ldc 1.000000
	fcmpl
	ifeq Label_08
	ldc "2.2!=1.0 is True"
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
	goto EXIT_02
Label_08 : 
	ldc "False"
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V
EXIT_02 : 
	return
.end method
