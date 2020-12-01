CC= gcc
OBJ= max.o min.o var.o

ifeq (${DEBUG},yes)
	CC_OPTIONS=-g -Wall
	MODE= Mode Debug
else
	CC_OPTIONS= 
	MODE= Mode Release
endif
mode : test.exe
	@echo "$(MODE)"

max.o : max.c	
	${CC} ${CC_OPTIONS} -c $^

min.o : min.c
	${CC} ${CC_OPTIONS} -c $^

var.o : var.c
	${CC} ${CC_OPTIONS} -c $^

test.o : test.c
	${CC} ${CC_OPTIONS} -c $^

test.exe : test.o ${OBJ}
	${CC} ${CC_OPTIONS} -o $@ $< ${OBJ} 

install : test.exe
	mv test.exe ${HOME}

clean: 
	rm ${OBJ}
