%{
#include "prog.tab.h"
%}

%%
[ \t]  { /* skip whitespace */ }
[\n]   { return 0; }
.      { return yytext[0]; }
%%

int yywrap(void)
{
    return 1;
}
