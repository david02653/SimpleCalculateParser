%{
    #include"myGrammar.tab.h"
    #include <stdlib.h>
%}

%%

"+"     { return ADD; }
"-"     { return SUB; }
"*"     { return MUL; }
"/"     { return DIV; }
[0-9]+  { yylval = atoi(yytext); return NUM; }
\n      { return EOL; }
"("     { return LL; }
")"     { return RR; }
"|"     { return ABS; }
"^"     { return POW; }
"?"     { return DF;}  
[\t]    {/* nothing */}
.       { printf("Unrecognized character: %s\n", yytext); }

%%
