.class public main
.super java/lang/Object
.method public static main([Ljava/lang/String;)V
.limit stack 30
.limit locals 10

	goto Main
PrintMe : 
	astore 9
	getstatic java/lang/System/out Ljava/io/PrintStream;
	swap
	invokevirtual java/io/PrintStream/println(Ljava/lang/String;)V

	ret 9

Main : 
	ldc "Message1"
	jsr PrintMe
	return	
.end method
