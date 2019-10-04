%{
    #include <stdio.h>
%}

%%

"+"     { printf("+: token ADD\n"); }
"-"     { printf("-: token SUB\n"); }
"*"     { printf("*: token MUL\n"); }
"/"     { printf("/: token DIV\n"); }
[0-9]+  { printf("%s: token NUM\n", yytext); }
\n      { printf("\\n: token EOL\n"); }
"("     { printf("(: token LL\n"); }
")"     { printf("): token RR\n"); }
"|"     { printf("|: token ABS\n"); }
"^"     { printf("^: token POW\n"); }
"?"     { printf("?: token DF\n"); }
[\t]    {/* nothing */}
.       { printf("Unrecognized character: %s\n", yytext); }

%%

int main(int argc, char *argv[]){
    yylex();
    return 0;
}
