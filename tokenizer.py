from tokenfile import Token


class Tokenizer:

    def __init__(self, origin: str):
        self.origin = origin
        self.position = 0
        self.actual = None
        self.keywords = {"chamanoprint": "PRINT",
                        "receba": "READLINE", "sedale": "IF", "doly": "ELSE", "senaodele": "ELSEIF", 
                        "whilezada": "WHILE", "end": "END", "intorone":"INT", "booleanorone":"BOOL", "stringorone":"STRING",
                        "local": "LOCAL", "truedatrue":"TRUE", "falsorone":"FALSE", "functionzada":"FUNCTION",
                        "retornab": "RETURN"}

    def selectNext(self):

        if self.position == len(self.origin):
            self.actual = Token("EOF", '"')
        
        elif self.origin[self.position] == " ":
            self.position += 1
            self.selectNext()
        
        elif self.origin[self.position].isnumeric():
            tok = ""
            while (self.position < (len(self.origin)) and self.origin[self.position].isnumeric()):
                tok += self.origin[self.position]
                self.position += 1
                if self.origin[self.position].isalpha() or self.origin[self.position] == "_":
                   raise NameError('Syntaxe incorrect, Number first then Alpha in variable assignment')
            self.actual = Token("INT", int(tok))
            #self.position += 1

        elif self.origin[self.position].isalpha():
            tok = ""
            while (self.position < (len(self.origin))) and \
                    (self.origin[self.position].isalpha() or \
                     self.origin[self.position] == '_' or \
                     self.origin[self.position].isnumeric()):
                tok += self.origin[self.position]
                self.position += 1
          
            if tok in self.keywords:
                self.actual = Token(self.keywords[tok], tok)
            else:
                self.actual = Token("IDENTIFIER", tok)
            

        elif self.origin[self.position] == '"':
            tok = ""
            self.position += 1
            while (self.position < (len(self.origin))) and \
                self.origin[self.position] != '"':
                tok += self.origin[self.position]
                self.position += 1

            self.position += 1
            self.actual = Token("STRING", tok)

        elif self.origin[self.position] == '+':
            self.actual = Token("PLUS", '+')
            self.position += 1
             

        elif self.origin[self.position] == '-':
            self.actual = Token("MINUS", '-')
            self.position += 1
             
        
        elif self.origin[self.position] == '*':
            self.actual = Token("MULTI", '*')
            self.position += 1
             
        
        elif self.origin[self.position] == '/':
            self.actual = Token("DIV", '/')
            self.position += 1
             

        elif self.origin[self.position] == '(':
            self.actual = Token("OPEN_P", '(')
            self.position += 1
             
        
        elif self.origin[self.position] == ')':
            self.actual = Token("CLOSE_P", ')')
            self.position += 1
             

        elif self.origin[self.position] == '<':
            self.actual = Token("MENOR", '<')
            self.position += 1
             

        elif self.origin[self.position] == '>':
            self.actual = Token("MAIOR", '>')
            self.position += 1
             

        elif self.origin[self.position] == '|':
            self.position += 1
            if(self.position < len(self.origin)):
                if(self.origin[self.position] == '|'):
                    self.actual = Token("OR", '||')
                    self.position += 1
                     
            else:
                raise NameError("Error in char '|' ")

        elif self.origin[self.position] == '&':
            self.position += 1
            if(self.position < len(self.origin)):
                if(self.origin[self.position] == '&'):
                    self.actual = Token("AND", '&&')
                    self.position += 1
                     
            else:
                raise NameError("Error in char '&' ")

        elif self.origin[self.position] == '!':
            self.actual = Token("NOT", '!')
            self.position += 1
             

        elif self.origin[self.position] == '=':
            self.actual = Token("IGUAL", '=')
            self.position += 1
            if(self.position < len(self.origin)):
                if(self.origin[self.position] == '='):
                    self.actual = Token("IGUAL_I", '==')
                    self.position += 1
             
        
        elif self.origin[self.position] == ':':
            self.actual = Token("DOIS_P", ':')
            self.position += 1
            if(self.position < len(self.origin)):
                if(self.origin[self.position] == ':'):
                    self.actual = Token("DOIS_PP", '::')
                    self.position += 1
             

        elif self.origin[self.position] == '\n':
            self.actual = Token("BREAK", '\n')
            self.position += 1
             

        elif self.origin[self.position] == "," :
            self.actual = Token('COMMA', ",")
            self.position += 1
             

        else:
            raise NameError("Invalid character")

        #print(self.actual.value, self.actual.type)
