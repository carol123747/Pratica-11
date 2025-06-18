%%

%class SqlLexer
%cup
%unicode

id = [a-zA-Z_][a-zA-Z0-9_]*
numero = [0-9]+

%%

"SELECT"  { return new Symbol(sym.SELECT); }
"FROM"    { return new Symbol(sym.FROM); }
"WHERE"   { return new Symbol(sym.WHERE); }
","       { return new Symbol(sym.VIRG); }
"="       { return new Symbol(sym.IGUAL); }
{id}      { return new Symbol(sym.ID, yytext()); }
{numero}  { return new Symbol(sym.NUM, Integer.parseInt(yytext())); }

[ \t\r\n]+   { /* ignorar espaços em branco */ }

.            { System.out.println("Caractere inválido: " + yytext()); return null; }