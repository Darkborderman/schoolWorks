CC = gcc -g
YFLAG = -d
FNAME = compiler_hw3
PARSER = myparser
OBJECT = lex.yy.c y.tab.c y.tab.h ${FNAME}.j ${FNAME}.class

all: y.tab.o lex.yy.o
	@${CC} -o ${PARSER} y.tab.o lex.yy.o

%.o: %.c
	@${CC} -c $<

lex.yy.c:
	@lex ${FNAME}.l

y.tab.c:
	@yacc ${YFLAG} ${FNAME}.y

test:
	@./${PARSER} < ./example_input/basic_declaration.c
	@echo -e "\n\033[1;33mmain.class output\033[0m"
	@java -jar jasmin.jar ${FNAME}.j
	@java ${FNAME} 

clean:
	rm -f *.o ${PARSER} ${OBJECT} 
