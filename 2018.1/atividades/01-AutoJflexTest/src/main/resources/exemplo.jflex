package atividade1;

%%

/* Não altere as configurações a seguir */

%line
%column
%unicode
//%debug
%public
%standalone
%class Minijava
%eofclose

/* Insira as regras léxicas abaixo */

%{
	int numberIDs = 0;
%}

%eof{
	System.out.println("Quantidade de operadores encontrados: " + numberIDs);
%eof}

letter 			= [A-Za-z]
digit 			= [0-9]
integer			= {digit}+
alphanumeric	= {digit} | {letter}
identifier		= ({letter} | [_])({alphanumeric} | [_])*
whitespace		= [ \n\t\r\f]
operators		= "&&" | "==" | "<" || "!=" || "+" || "-" || "*" || "!"

%%

{identifier}	{System.out.println("ID");}
{operators}		{System.out.println("Operador: " + yytext());}
    
/* Insira as regras léxicas no espaço acima */     
     
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
