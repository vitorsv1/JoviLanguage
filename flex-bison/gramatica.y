%{
  #include <stdio.h>
  extern void yyerror();
  extern int yylex();
  extern char* yytext;
  extern int yylineno;
%}

%define parse.lac full
%define parse.error verbose

%union{
	char* dataType;
	char charVal;
	int intVal;
	float floatVal;
	char* strVal;
}

%token DEF
%token ASPAS_SIMPLES
%token IGUAL
%token PONTO_V
%token DOIS_P
%token ABRE_P
%token FECHA_P
%token VIRGULA
%token TRUE
%token FALSE
%token IF
%token ELIF
%token ELSE
%token WHILE
%token PRINT
%token AND
%token OR
%token IS
%token NOT
%token MENOR
%token MAIOR
%token MENOR_I
%token MAIOR_I
%token DIF
%token IGUAL_I
%token MAIS
%token MENOS
%token MULT
%token DIV
%token DIV_INT
%token RESTO
%token <dataType> DATA_TYPE
%token <charVal> CHARACTER_VALUE
%token <intVal> INTEGER_VALUE
%token <floatVal> FLOAT_VALUE
%token <strVal> STRING_VALUE
%token <strVal> IDENTIFIER_VALUE

// NAO TERMINAIS
%type <strVal> PROGRAMA_N
%type <strVal> FUNCAO_N
%%
BLOCO: PROGRAMA 
      | BLOCO PROGRAMA;

PROGRAMA: FUNCAO_N
			| WHILE_N
			| IF_N
			| DECLARA
			| PRINTA
;


FUNCAO_N: DEF DATA_TYPE IDENTIFIER_VALUE ABRE_P ARGS2_N FECHA_P BLOCO_N;

WHILE_N: WHILE ABRE_P CONDITION_N FECHA_P BLOCO_N ;

IF_N: IF ABRE_P CONDITION_N FECHA_P  BLOCO_N  
	| IF ABRE_P CONDITION_N FECHA_P  BLOCO_N ELIF_N  
;

ELIF_N: ELIF ABRE_P CONDITION_N FECHA_P  BLOCO_N ELIF_N
		| ELIF ABRE_P CONDITION_N FECHA_P  BLOCO_N ELSE  BLOCO_N
;

FUNC_IDENTIFIER_VALUE: IDENTIFIER_VALUE ABRE_P ARGS_N FECHA_P;

CONDITION_N: RELEX_N
			| RELEX_N AND CONDITION_N
			| RELEX_N OR CONDITION_N
;

RELEX_N: EXPR_N
		| EXPR_N COND_OP_N RELEX_N
;

EXPR_N: TERM_N
		| TERM_N MAIS EXPR_N
		| TERM_N MENOS EXPR_N
;

TERM_N: FACTOR_N
		| FACTOR_N MULT TERM_N
		| FACTOR_N DIV TERM_N
		| FACTOR_N RESTO TERM_N
		| FACTOR_N DIV_INT TERM_N
;

FACTOR_N: INTEGER_VALUE
			| FLOAT_VALUE
			| TRUE
			| FALSE
			| STRING_VALUE
			| CHARACTER_VALUE
			| MAIS FACTOR_N
			| MENOS FACTOR_N
			| ABRE_P CONDITION_N FECHA_P
			| IDENTIFIER_VALUE
			| FUNC_IDENTIFIER_VALUE
;

COND_OP_N: IS
			| NOT 
			| MAIOR 
			| MAIOR_I 
			| MENOR 
			| MENOR_I
;

ARGS2_N: DATA_TYPE FUNC_IDENTIFIER_VALUE
		| DATA_TYPE IDENTIFIER_VALUE VIRGULA ARGS2_N
;

ARGS_N: CONDITION_N
		| DATA_TYPE IDENTIFIER_VALUE
		| CONDITION_N VIRGULA ARGS_N
		| DATA_TYPE IDENTIFIER_VALUE VIRGULA ARGS_N
;
%%

int main(){
  yyparse();
  printf("Compilado sem erros!!\n");
  return 0;
}