all :
	# Generate Parser
	bison -d calc.y
	mv calc.tab.c calc.tab.cc
	clang++ -g -std=c++14 -Wall -Wextra -Wpedantic -Wno-unused-function -c calc.tab.cc -o calc.y.o

	# Lexical analyser
	flex -o lex.yy.cc calc.lex
	clang++ -g -std=c++14 -Wall -Wextra -Wpedantic -Wno-unused-function -c lex.yy.cc -o calc.lex.o

	# Link
	clang++ -g -std=c++14 -Wall -Wextra -Wpedantic -o calc calc.lex.o calc.y.o -ll -lm

clean:
	rm -f calc calc.tab.h lex.yy.c calc.lex.o calc.tab.c calc.y.o calc.tab.cc calc.tab.hh lex.yy.cc

format:
	clang-format -style=file -i arbnumber.h calculate_funcs.h global.h helper_funcs.h parse_helper_funcs.h table.h

