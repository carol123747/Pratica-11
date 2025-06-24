import java_cup.runtime.Symbol;

%%

// Diretivas:
%cup
%unicode
%line
%column
%class SqlLexer

// Macros:
id = [a-zA-Z_][a-zA-Z0-9_]* // identificador (nome de tabela, coluna, etc.)
numero = [0-9]+             // número inteiro
string = \"[^\"]*\"         // string entre aspas

%%

// Regras de reconhecimento de tokens
"SELECT"     { return new Symbol(sym.SELECT); }                            // SELECT
"FROM"       { return new Symbol(sym.FROM); }                              // FROM
"WHERE"      { return new Symbol(sym.WHERE); }                             // WHERE
","          { return new Symbol(sym.VIRG); }                              // vírgula
";"          { return new Symbol(sym.PVIRG); }                             // ponto e vírgula
"="          { return new Symbol(sym.IGUAL); }                             // igual
">"          { return new Symbol(sym.MAIOR); }                             // maior
"<"          { return new Symbol(sym.MENOR); }                             // menor
{string}     { return new Symbol(sym.STRING, yytext().substring(1, yytext().length() - 1)); } // string sem aspas
{id}         { return new Symbol(sym.ID, yytext()); }                      // identificador
{numero}     { return new Symbol(sym.NUM, Integer.parseInt(yytext())); }   // número

[ \t\r\n]+   { /* Ignorar espaços em branco */ } // espaços em branco

.            { System.out.println("Caractere inválido: " + yytext()); return null; } // trata erros
