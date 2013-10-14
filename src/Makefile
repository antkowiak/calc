all :
	bison -d calc.y
	mv calc.tab.h calc.h
	mv calc.tab.c calc.y.c
	flex calc.lex
	mv lex.yy.c calc.lex.c
	gcc -c calc.lex.c -o calc.lex.o
	gcc -c calc.y.c -o calc.y.o
	gcc -o calc calc.lex.o calc.y.o -ll -lm

clean:
	rm -f calc calc.h calc.lex.c calc.lex.o calc.y.c calc.y.o
