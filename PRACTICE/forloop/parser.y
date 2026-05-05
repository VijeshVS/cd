%{
    #include <stdio.h>
    #include <stdlib.h>
    
    int yylex(void);
    void yyerror(const char* s);
%}

%token FOR RELOP NUM ID INCDEC
%left '+' '-'
%left '*' '/'
%%

program: level1;
level1: FOR '(' expr_opt ';' expr_opt ';' expr_opt ')' '{' 

expr_opt: condition |  | simple_stmt;
condition: expr RELOP expr;

expr: expr '+' term | expr '-' term | term;
term: term '*' factor | term '/' factor | factor;
factor: ID | NUM | '(' expr ')'; 

simple_stmt: ID '=' expr | ID INCDEC | INCDEC ID;

stmt_list : | stmt_list stmt;
stmt: simple_stmt ';' | ';';

%%

int main(void){
    printf("Enter the code: ");
    if(yyparse() == 0){
        printf("Valid !!");
    }
    else {
        printf("Invalid !!");
    }
}

void yyerror(const char* s){
    
}