%{
    #include <stdio.h>
    #include <stdlib.h>
    
    int yylex(void);
    void yyerror(const char* s);
%}

%%
S: A B;
A: 'a' A 'b' | 'a' 'b';
B: 'b' B 'c' | 'b' 'c';
%%

int main(){
    printf("Enter the string: ");
    if(yyparse() == 0)
        printf("String is valid !!\n");
    else
        printf("String is invalid !!\n");
}

void yyerror(const char* s){
    
}