all :
	bison -d calc.y
	flex calc.lex
	gcc -g -Wall -Wno-unused-function -c lex.yy.c -o calc.lex.o
	gcc -g -Wall -c calc.tab.c -o calc.y.o
	gcc -g -Wall -o calc calc.lex.o calc.y.o -ll -lm

clean:
	rm -f calc calc.tab.h lex.yy.c calc.lex.o calc.tab.c calc.y.o
