import java_cup.runtime.Symbol;

%%

// Diretivas:
%cup
%unicode
%line
%column
%class JsonLexer

//MACROS
string = "([^\"])*"  //string JSON 
numero = -?[0-9]+    //número, que pode ser negativo

%%

// Regras para os tokens
"{"     { return new Symbol(sym.ABRE_CHAVE); }         //abre chaves
"}"     { return new Symbol(sym.FECHA_CHAVE); }        //fecha chaves
"["     { return new Symbol(sym.ABRE_COLCHETE); }      //abre colchete
"]"     { return new Symbol(sym.FECHA_COLCHETE); }     //fecha colchete
":"     { return new Symbol(sym.DOIS_PONTOS); }        //dois pontos
","     { return new Symbol(sym.VIRG); }               //vírgula
{string}  { return new Symbol(sym.STRING, yytext()); } //string
{numero}  { return new Symbol(sym.NUM, Integer.parseInt(yytext())); } // Reconhece um número

[ \t\r\n]+   { /* Ignorar espaços em branco */ }        // Ignora espaços em branco

.            { System.out.println("Caractere inválido: " + yytext()); return null; } //caracteres inválidos
