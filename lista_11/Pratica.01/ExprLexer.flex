%%

%class ExprLexer
%cup
%unicode

%%

// Regras para os tokens
[0-9]+      { return new Symbol(sym.NUM, Integer.parseInt(yytext())); }              // números inteiros
"("         { return new Symbol(sym.ABRE); }                                         // parêntese de abertura
")"         { return new Symbol(sym.FECHA); }                                        // parêntese de fechamento
"+"         { return new Symbol(sym.MAIS); }                                         // adição
"-"         { return new Symbol(sym.MENOS); }                                        // subtração
"*"         { return new Symbol(sym.VEZES); }                                        // multiplicação
"/"         { return new Symbol(sym.DIV); }                                          // divisão
"%"         { return new Symbol(sym.REST); }                                         // resto
"^"         { return new Symbol(sym.POT); }                                          // potência

[ \t\r\n]+   { /* Ignorar espaços em branco */ }                                     // Ignora espaços em branco

.            { System.out.println("Caractere inválido: " + yytext()); return null; } // Trata caracteres inválidos
