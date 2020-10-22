%{
    #include <string.h>
    #include <stdlib.h>
    #include "y.tab.h"
    void extern yyerror(char*);
    void InvalidToken();
%}

whitespace      [ \t\r\v\f]
linefeed        \n

%%
"'"												                            {return ASPAS_SIMPLES;}
"="												                            {return IGUAL;}
";"												                            {return	PONTO_V;}
":"												                            {return DOIS_P;}
"("												                            {return ABRE_P;}
")"												                            {return FECHA_P;}
","												                            {return	VIRGULA;}
"true"                                                                      {return TRUE;}
"false"                                                                     {return FALSE;}
"deforone"                                                                  {return DEF;}
"dale"											                            {return IF;}
"dele"											                            {return ELIF;}
"dole"											                            {return ELSE;}
"whilezada"									                                {return WHILE;}
"chamanoprint"                                                              {return PRINT;}
"and"										                            	{return AND;}
"or"							                            				{return OR;}
"is"							                            				{return IS;}
"!"									                            		    {return NOT;}
"!="									                            		{return DIF;}
"=="									                            		{return IGUAL_I;}
"<" 									                            		{return MENOR;}
">"	    								                            		{return MAIOR;}
"<="								                            			{return MENOR_I;}
">="								                            			{return MAIOR_I;}
"+"										                            		{return	MAIS;}
"-"									                            			{return MENOS;}
"*"								                            				{return MULT;}
"/"									                            			{return DIV;}
"//"							                            				{return DIV_INT;}
"%"									                            			{return RESTO;}
[\"][a-zA-Z0-9][\"]						                            		{yylval.charVal = yytext[1]; return CHARACTER_VALUE;}
[-+]?[0-9]+                                                                 {yylval.intVal = atoi(yytext); return INTEGER_VALUE;}
[-+]?[0-9]*\.?[0-9]+                                                        {yylval.floatVal = atof(yytext); return FLOAT_VALUE;}
[a-zA-Z][_a-zA-Z0-9]*					                            		{yylval.strVal = strdup(yytext); return IDENTIFIER_VALUE;}
\"(\\.|[^"])*\"                                                             {yylval.strVal = strdup(yytext); return STRING_VALUE;}


{linefeed}                                                                  {yylineno++;}
{whitespace}                                                                ;
.                                                                           {InvalidToken();}
%%

int yywrap(void){
    return 1;
}

void yyerror(char *s) {
    fprintf(stderr, "\nERRO NA LINHA %d : \n %s\n", yylineno, s);
    exit(0);
}

void InvalidToken(){
    printf("ERRO NA LINHA %d : \n Token Invalido: %s\n", yylineno,yytext);
    exit(0);
}