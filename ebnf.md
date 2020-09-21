Jovi EBNF

It's a langueage based on words used by Jovirone, streamer of League of Legends.

## EBNF

- PROGRAMA = {FUNCAO};
- FUNCAO = TIPO, IDENTIFICADOR, "(", {TIPO, IDENTIFICADOR, ","}, ")", BLOCO;
- BLOCO = "{" , DENTROBLOCO , "}";
- DENTROBLOCO = NOOP | DECLARA | ATRIBUI | PRINTA | SE | SENAO | BLOCO | ENQUANTO | TIPO, IDENTIFICADOR | "retornab", "(", EXPRESSAO_COMPARACAO, ")", NOOP;

- TIPO = "intorone" | "floatorone" | "booleanorone";

- NOOP = ";";

- DECLARA = (TIPO), IDENTIFICADOR, NOOP;
- ATRIBUI = IDENTIFICADOR, "=", EXPRESSAO, NOOP;
- PRINTA = "chama", "(", EXPRESSAO, ")", NOOP;

- SE = "dale", "(", EXPRESSAO_COMPARACAO ")", DENTROBLOCO, {SENAO};
- SENAO = "dele", DENTROBLOCO;
- ENQUANTO = "dole", "(", EXPRESSAO_COMPARACAO, ")", DENTROBLOCO;

- EXPRESSAO_COMPARACAO = EXPRESSAO | {("==" | ">" | "<"), EXPRESSAO};
- EXPRESSAO = TERMO, {("+" | "||" | "-"), TERMO};
- TERMO = FATOR, {("/" | "*" | "&&" | "**" | "//" | "%"), FATOR};
- FATOR = (("+", "-"), FATOR) | NUMERO | FLOAT | "(",EXPRESSAO,")" | IDENTIFICADOR, { "(", { EXPRESSAO_COMPARACAO, "," } ")"} | "true" | "false" ;

- IDENTIFICADOR = CHAR, {DIGITO | CHAR | "_" };
- FLOAT = NUMERO, ".", NUMERO;
- NUMERO = DIGITO, {DIGITO};
- CHAR = (a | ... | z | A | ... | Z);
- DIGITO = (1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0);