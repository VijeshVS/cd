%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
void yyerror(const char *s);
%}

%union{
    char* str;
    int num;
}

%token <str> ID STRING
%token <num> NUM
%token INT MAIN PRINTF

%%

program:
    INT MAIN '(' ')' '{' stmts '}'
    ;

stmts:
      stmts stmt
    |
    ;

stmt:

    /* int a = 5; */
    INT ID '=' NUM ';'
    {
        printf("mov $%d, %s\n", $4, $2);
    }

    /* c = a + b; */
    | ID '=' ID '+' ID ';'
    {
        printf("mov %s, eax\n", $3);
        printf("add %s, eax\n", $5);
        printf("mov eax, %s\n", $1);
    }

    /* printf("%d", c); */
    | PRINTF '(' STRING ',' ID ')' ';'
    {
        printf("print %s\n", $5);
    }
    ;

%%

int main()
{
    yyparse();
    return 0;
}

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}