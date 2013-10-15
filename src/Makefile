all :
	bison -d calc.y
	flex calc.lex
	gcc -c lex.yy.c -o calc.lex.o
	gcc -c calc.tab.c -o calc.y.o
	gcc -o calc calc.lex.o calc.y.o -ll -lm

clean:
	rm -f calc calc.tab.h lex.yy.c calc.lex.o calc.tab.c calc.y.o
