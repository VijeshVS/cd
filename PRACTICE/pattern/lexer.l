%{
    #include <stdio.h>
    #include "parser.tab.h"    
%}

%%
[ \t\n] {}
. {return yytext[0];}
%%

int yywrap(void){
    return 1;
}