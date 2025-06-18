/* Definição: seção para código do usuário. */

import java_cup.runtime.Symbol;

%%

/* Opções e Declarações: seção para diretivas e macros. */

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

/* Regras e Ações Associadas: seção de instruções para o analisador léxico. */

{inteiro} {
            Integer numero = Integer.valueOf(yytext());
            return new Symbol(sym.INTEIRO, yyline, yycolumn, numero);
          }
"+"       { return new Symbol(sym.MAIS); }
"-"       { return new Symbol(sym.MENOS); }
"("       { return new Symbol(sym.PARENTESQ); }
")"       { return new Symbol(sym.PARENTDIR); }
";"       { return new Symbol(sym.PTVIRG); }
\n        { /* Ignora nova linha. */ }
"*"       { return new Symbol(sym.MULT); }       // Multiplicação
"/"       { return new Symbol(sym.DIV); }        // Divisão
"%"       { return new Symbol(sym.MOD); }        // Módulo (resto)
"^"       { return new Symbol(sym.POW); }        // Potenciação
[ \t\r]+  { /* Ignora espaços. */ }
.         { System.err.println("\n Caractere inválido: " + yytext() +
                               "\n Linha: " + yyline +
                               "\n Coluna: " + yycolumn + "\n"); 
            return null; 
          }