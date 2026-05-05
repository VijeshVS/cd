%{
#include <stdio.h>
#include <stdlib.h>

struct incod {
    char opd1, opd2, opr;
} code[20];

int ind = 0;
int flag = 0;
char temp = 'T';

char AddToTable(char, char, char);
void generateCode();
%}

%union { char sym; }

%token <sym> LETTER NUMBER
%type <sym> expr

%left '+' '-'
%left '*' '/'

%%
statement:
      LETTER '=' expr ';'   { AddToTable($1, $3, '='); }
    | expr ';'
    ;

expr:
      expr '+' expr { $$ = AddToTable($1, $3, '+'); }
    | expr '-' expr { $$ = AddToTable($1, $3, '-'); }
    | expr '*' expr { $$ = AddToTable($1, $3, '*'); }
    | expr '/' expr { $$ = AddToTable($1, $3, '/'); }
    | '(' expr ')'  { $$ = $2; }
    | NUMBER        { $$ = $1; }
    | LETTER        { $$ = $1; }
    ;
%%

char AddToTable(char opd1, char opd2, char opr) {
    code[ind].opd1 = opd1;
    code[ind].opd2 = opd2;
    code[ind].opr  = opr;

    char ret = temp;
    temp++;
    ind++;

    return ret;
}

void generateCode() {
    printf("\nThree Address Code:\n");
    for (int i = 0; i < ind; i++) {
        if (code[i].opr == '=') {
            printf("%c = %c\n", code[i].opd1, code[i].opd2);
        } else {
            printf("T%d = %c %c %c\n", i, code[i].opd1, code[i].opr, code[i].opd2);
        }
    }

    printf("\nQuadruple Code:\n");
    for (int i = 0; i < ind; i++) {
        printf("%d\t%c\t%c\t%c\n", i, code[i].opr, code[i].opd1, code[i].opd2);
    }

    printf("\nTriple Code:\n");
    for (int i = 0; i < ind; i++) {
        printf("%d\t%c\t%c\t%c\n", i, code[i].opr, code[i].opd1, code[i].opd2);
    }
}

int main() {
    printf("Enter Expression (e.g. a = b + c;):\n");
    yyparse();

    if (flag == 0)
        generateCode();

    return 0;
}

int yyerror(char *s) {
    flag = 1;
    printf("Error: %s\n", s);
    return 0;
}