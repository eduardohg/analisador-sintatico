FLEX=flex
BISON=bison
CC=gcc

PROGRAMA = sintatico
LEXICO = lexico.l
SINTATICO = main.y

$(PROGRAMA): $(LEXICO) $(SINTATICO)
	$(FLEX) $(LEXICO)
	$(BISON) -d $(SINTATICO)
	$(CC) -c lex.yy.c main.tab.c -I.
	$(CC) *.o -o $(PROGRAMA)

clean:
	rm -f *.yy.c
	rm -f *.tab.c
	rm -f *.tab.h
	rm -f *.o
	rm -f sintatico
