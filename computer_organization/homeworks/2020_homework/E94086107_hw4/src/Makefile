SHELL   := /bin/bash
CC_C    := gcc
CC_CPP  := g++
EXE     := cache
SRC_C   := cache.c
SRC_CPP := cache.cpp
OBJ     := cache.o
PYTHON  := python3
# CLIENT  := client.py
VERIFY_EXE := Verify
# VERIFY_OBJ := verify.o
# VERIFY_SRC := verify.cpp
LIBDIR  := ./lib/
INCLUDE := .
CFLAGS  := -I${INCLUDE}
LIBFLAG := -L${LIBDIR} -Wl,-rpath,${LIBDIR}
 
PREOPERATION := 
ifneq (${REQ_FILE},)
PREOPERATION += ${REQ_FILE}
endif
ifneq (${VIC_FILE},)
PREOPERATION += ${VIC_FILE}
endif

.PHONY: all clean

all:
	 
${EXE}: ${OBJ}
	@${CC_CPP} ${OBJ} -o ${EXE}
		 
${OBJ}:
	@if [ -f ${SRC_C} ]; then \
	    ${CC_C} -c ${SRC_C} -o ${OBJ}; \
	else \
	    ${CC_CPP} -c ${SRC_CPP} -o ${OBJ}; \
	fi
			 
# ${VERIFY_EXE}: ${VERIFY_OBJ}
# 	@${CC_CPP} ${VERIFY_OBJ} -o ${VERIFY_EXE}
# 		 
# ${VERIFY_OBJ}: ${VERIFY_SRC}
# 	@${CC_CPP} -c ${VERIFY_SRC} -o ${VERIFY_OBJ}
# 
sim: clean ${EXE}
	./${EXE} ${PREOPERATION}
	 
BLUE   = \033[1;34m
RED    = \033[1;31m
NORMAL = \033[0m
	 
verify: sim ${VERIFY_EXE}
	# @${PYTHON} ${CLIENT} ${PREOPERATION}
	./${VERIFY_EXE} ${PREOPERATION}

clean:
	@rm -rf ${EXE} *.o
