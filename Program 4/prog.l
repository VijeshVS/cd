%{
#include "y.tab.h"
%}

%%
[0-9]+          { yylval.sym = yytext[0]; return NUMBER; }
[a-zA-Z]        { yylval.sym = yytext[0]; return LETTER; }
[ \t]           ;   // ignore spaces
\n              return 0;
.               return yytext[0];
%%

int yywrap() {
    return 1;
}