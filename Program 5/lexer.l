%{
#include "parser.tab.h"
#include <stdlib.h>
#include <string.h>
%}

DIGIT   [0-9]
ID      [a-zA-Z][a-zA-Z0-9]*
STRING  \"[^\"]*\"

%%

"int"          { return INT; }
"main"         { return MAIN; }
"printf"       { return PRINTF; }

{STRING}       {
                    yylval.str = strdup(yytext);
                    return STRING;
               }

{ID}           {
                    yylval.str = strdup(yytext);
                    return ID;
                }

{DIGIT}+       {
                    yylval.num = atoi(yytext);
                    return NUM;
               }

"+"            { return '+'; }
"="            { return '='; }
"("            { return '('; }
")"            { return ')'; }
";"            { return ';'; }
","            { return ','; }
"{"            { return '{'; }
"}"            { return '}'; }

[ \t\n]        { }

.              {
                    printf("Invalid character: %s\n", yytext);
                }

%%

int yywrap()
{
    return 1;
}