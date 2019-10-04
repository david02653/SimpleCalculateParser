%{
    #include <math.h>
    #include <stdio.h>
    int yylex();
    int yyerror(char* s);
%}

%token NUM
%token SUB ADD
%token MUL DIV
%token EOL
%token LL RR
%token ABS
%token POW
%token DF

%%
input:    /* empty string */
        | input line
;

line:     EOL
        | exp EOL   { printf ("%d\n", $1); }
        | error EOL { yyerrok; }
;

exp:      factor             { $$ = $1;         }
        | exp ADD factor     { $$ = $1 + $3;    }
        | exp SUB factor     { $$ = $1 - $3;    }
;

factor:   upp                { $$ = $1;         }
        | factor MUL upp     { $$ = $1 * $3;      }
        | factor DIV upp     { $$ = $1 / $3;      }
        | factor DF upp      { $$ = fmod($1,$3)   ;  }
        ;

upp:     term                { $$ = $1; }
        | upp POW term       { $$ = pow ($1, $3); }

        ;

term:     id                 { $$ = $1; }
        | LL exp RR          { $$ = $2; }
        ;

id:       NUM                { $$ = $1; }
        | ABS term           { $$ = $2>=0?$2:-$2; }
        ;
%%

int main (int argc, char** argv)
{
  yyparse ();
  return 0;
}

int yyerror (char* s)  /* Called by yyparse on error */
{
  printf ("%s\n", s);
  return 0;
}
