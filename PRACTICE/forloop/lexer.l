%{
    #include "parser.tab.h"    
    #include <stdlib.h>
%}

%%

"for" {return FOR;}
"=="|"!="|">"|"<"|"<="|">=" {return RELOP;}
"++"|"--" {return INCDEC;}
[\t\n] {}
[0-9]+ {return NUM;}
[a-zA-Z_][a-zA-Z_0-9]* {return ID;}
. {return yytext[0];}

%%

int yywrap(void){
    return 1;
}
