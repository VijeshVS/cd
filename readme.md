# Execute Commands

## LEX 

```
lex prog.l
gcc lex.yy.c -o lexprog
./lexprog
```

## YACC

```
yacc -d program.y
lex program.l
gcc lex.yy.c y.tab.c -ll -o parser
./parser
```# cd
