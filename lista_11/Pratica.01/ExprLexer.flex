import java_cup.runtime.Symbol;

%%

// Diretivas:
%cup
%unicode
%line
%column
%class MeuScanner

// Macros:
digito = [0-9]
inteiro = {digito}+

%%

// Regras para os tokens
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
