%%

%class ExprLexer
%cup
%unicode

%%

[0-9]+      { return new Symbol(sym.NUM, Integer.parseInt(yytext())); }
"("         { return new Symbol(sym.ABRE); }
")"         { return new Symbol(sym.FECHA); }
"+"         { return new Symbol(sym.MAIS); }
"-"         { return new Symbol(sym.MENOS); }
"*"         { return new Symbol(sym.VEZES); }
"/"         { return new Symbol(sym.DIV); }
"%"         { return new Symbol(sym.REST); }
"^"         { return new Symbol(sym.POT); }

[ \t\r\n]+   { /* ignorar espaços em branco */ }

.            { System.out.println("Caractere inválido: " + yytext()); return null; }