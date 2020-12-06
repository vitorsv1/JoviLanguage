/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    DEF = 258,
    IGUAL = 259,
    PONTO_V = 260,
    DOIS_P = 261,
    ABRE_P = 262,
    FECHA_P = 263,
    ABRE_B = 264,
    FECHA_B = 265,
    VIRGULA = 266,
    TRUE = 267,
    FALSE = 268,
    IF = 269,
    ELIF = 270,
    ELSE = 271,
    WHILE = 272,
    PRINT = 273,
    AND = 274,
    OR = 275,
    IS = 276,
    NOT = 277,
    MENOR = 278,
    MAIOR = 279,
    MENOR_I = 280,
    MAIOR_I = 281,
    DIF = 282,
    IGUAL_I = 283,
    MAIS = 284,
    MENOS = 285,
    MULT = 286,
    DIV = 287,
    DIV_INT = 288,
    RESTO = 289,
    INT = 290,
    CHAR = 291,
    FLOAT = 292,
    BOOL = 293,
    CHARACTER_VALUE = 294,
    INTEGER_VALUE = 295,
    FLOAT_VALUE = 296,
    STRING_VALUE = 297,
    IDENTIFIER_VALUE = 298
  };
#endif
/* Tokens.  */
#define DEF 258
#define IGUAL 259
#define PONTO_V 260
#define DOIS_P 261
#define ABRE_P 262
#define FECHA_P 263
#define ABRE_B 264
#define FECHA_B 265
#define VIRGULA 266
#define TRUE 267
#define FALSE 268
#define IF 269
#define ELIF 270
#define ELSE 271
#define WHILE 272
#define PRINT 273
#define AND 274
#define OR 275
#define IS 276
#define NOT 277
#define MENOR 278
#define MAIOR 279
#define MENOR_I 280
#define MAIOR_I 281
#define DIF 282
#define IGUAL_I 283
#define MAIS 284
#define MENOS 285
#define MULT 286
#define DIV 287
#define DIV_INT 288
#define RESTO 289
#define INT 290
#define CHAR 291
#define FLOAT 292
#define BOOL 293
#define CHARACTER_VALUE 294
#define INTEGER_VALUE 295
#define FLOAT_VALUE 296
#define STRING_VALUE 297
#define IDENTIFIER_VALUE 298

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 12 "gramatica.y"

	char* dataType;
	char charVal;
	int intVal;
	float floatVal;
	char* strVal;

#line 151 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
