CC = gcc -g
YFLAG = -d
FNAME = compiler_hw3
PARSER = myparser
JAVABYTE = Computer
OBJECT = lex.yy.c y.tab.c y.tab.h ${JAVABYTE}.j ${EXE}.class
EXE = main

all: y.tab.o lex.yy.o
	@${CC} -o ${PARSER} y.tab.o lex.yy.o

%.o: %.c
	@${CC} -c $<

lex.yy.c:
	@lex ${FNAME}.l

y.tab.c:
	@yacc ${YFLAG} ${FNAME}.y

test:
	@./${PARSER} < ./input/basic_declaration.go 
	@echo -e "\n\033[1;33mmain.class output\033[0m"
	@java -jar jasmin.jar ${JAVABYTE}.j
	@java ${EXE} 

clean:
	rm -f *.o ${PARSER} ${OBJECT} 
