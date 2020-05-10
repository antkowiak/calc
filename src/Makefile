all :
	bison -d calc.y
	flex calc.lex
	g++ -g -Wall -Wextra -Wpedantic -Wno-unused-function -c lex.yy.c -o calc.lex.o
	g++ -g -Wall -Wextra -Wpedantic -Wno-unused-function -c calc.tab.c -o calc.y.o
	g++ -g -Wall -Wextra -Wpedantic -o calc calc.lex.o calc.y.o -ll -lm

clean:
	rm -f calc calc.tab.h lex.yy.c calc.lex.o calc.tab.c calc.y.o
