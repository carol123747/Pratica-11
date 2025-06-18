%%

%class JsonLexer
%cup
%unicode

string = "([^\"])*"
numero = -?[0-9]+

%%

"{"     { return new Symbol(sym.ABRE_CHAVE); }
"}"     { return new Symbol(sym.FECHA_CHAVE); }
"["     { return new Symbol(sym.ABRE_COLCHETE); }
"]"     { return new Symbol(sym.FECHA_COLCHETE); }
":"     { return new Symbol(sym.DOIS_PONTOS); }
","     { return new Symbol(sym.VIRG); }
{string}  { return new Symbol(sym.STRING, yytext()); }
{numero}  { return new Symbol(sym.NUM, Integer.parseInt(yytext())); }

[ \t\r\n]+   { /* ignorar espaços em branco */ }

.            { System.out.println("Caractere inválido: " + yytext()); return null; }