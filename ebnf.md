Jovi EBNF

It's a langueage based in Julia using words by the one and only - Jovirone, streamer of League of Legends.

## EBNF

- PROGRAM = { FUNCTION | COMMAND } ;
- BLOCK = { COMMAND } ;
- FUNCTION = "functionzada", IDENTIFIER, "(", (IDENTIFIER, "::", TYPE), {"," , IDENTIFIER, "::", TYPE}, ")", "::", TYPE, "\n", BLOCK, "end" ;
- FUNCALL = IDENTIFIER, "(", (REL_EXPRESSION), {"," , REL_EXPRESSION}, ")" ;
- COMMAND = ( λ | ASSIGNMENT | PRINT | IF | WHILE | LOCAL | RETURN | FUNCALL), "\n" ;
- RETURN = "retornab", REL_EXPRESSION ;
- LOCAL = "local", IDENTIFIER, "::", TYPE;
- ASSIGNMENT = IDENTIFIER, "=", REL_EXPRESSION | "receba", "(", ")" ;
- PRINT = "chamanoprint", "(", REL_EXPRESSION, ")" ;
- EXPRESSION = TERM, { ("+" | "-" | "||"), TERM } ;
- REL_EXPRESSION = EXPRESSION, { ("==" | ">" | "<"), EXPRESSION };
- WHILE = "whilezada", REL_EXPRESSION, "\n", BLOCK, "end";
- IF = "sedale", REL_EXPRESSION, "\n", BLOCK, { ELSEIF | ELSE }, "end";
- ELSEIF = "senaodele", REL_EXPRESSION, "\n", BLOCK, { ELSEIF | ELSE };
- ELSE = "doly", "\n", BLOCK;
- TERM = FACTOR, { ("*" | "/" | "&&"), FACTOR } ;
- FACTOR = (("+" | "-" | "!"), FACTOR) | NUMBER | BOOLEAN | STRING | "(", REL_EXPRESSION, ")" | IDENTIFIER | FUNCALL;
- IDENTIFIER = LETTER, { LETTER | DIGIT | "_" } ;
- TYPE = "intorone" | "stringorone" | "booleanorone"; 
- NUMBER = DIGIT, { DIGIT } ;
- STRING = '"', {.*?}, '"';
- BOOLEAN = "truedatrue" | "falsorone";
- LETTER = ( a | ... | z | A | ... | Z ) ;
- DIGIT = ( 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 ) ;