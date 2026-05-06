%{
#include <stdlib.h>
#include "prog.tab.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUM; }
[ \t\r\n]+    { /* skip whitespace */ }
.           { return yytext[0]; }
%%

int yywrap(void)
{
    return 1;
}
