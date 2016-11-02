%{
#include <stdlib.h>
void yyerror(char *);
#include "calc.tab.h"
%}

%%
	/* variables */
[a-z]		{
			yylval = *yytext - 'a';
			return VARIABLE;
		}

	/* numbers */ 

[0-9]+          {
                        yylval = atoi(yytext);
                        return INTEGER;
                }

	/* operators */
[-+()=/*\n]     return *yytext;

[\t]            ; /* skip whitespace */

.               yyerror("invalid character");

%%

int yywrap(void)
{
        return 1;
}


