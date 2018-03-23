package atividade1;

%%

/* N�o altere as configura��es a seguir */

%line
%column
%unicode
//%debug
%public
%standalone
%class Minijava
%eofclose

/* Insira as regras l�xicas abaixo */

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
whitespace		= [ \n\t\r\f]+
boolean			= "true" | "false"
conditions		= "if" | "else" | "while"
tipo 			= "int" | "String" | "boolean"
operators		= "&&" | "==" | "<" | "!=" | "+" | "-" | "*" | "!"
delimiters		= "," | ";" | "." | "=" | "(" | ")" | "{" | "}" | "[" | "]"  

%%

/* Palavaras reservadas */

"class"					{System.out.println("WORD: class");}
"public"				{System.out.println("WORD: public");}
"extends"				{System.out.println("WORD: extends");}
"static"				{System.out.println("WORD: static");}
"void"					{System.out.println("WORD: void");}
"main"					{System.out.println("WORD: main");}
"return"				{System.out.println("WORD: return");}
"length"				{System.out.println("WORD: length");}
"this"					{System.out.println("WORD: this");}
"new"					{System.out.println("WORD: new");}
"System.out.println"	{System.out.println("WORD: System.out.println");}

{boolean}		{System.out.println("BOOLEAN: " + yytext());}
{tipo}			{System.out.println("TYPE: " + yytext());}
{conditions}	{System.out.println("CONDITIONAL: " + yytext());}
{integer}		{System.out.println("NUMBER: " + yytext());}

{whitespace}	{ }

{identifier}	{numberIDs++; System.out.println("ID: " + yytext() + "NUMBER: " + numberIDs);}
{operators}		{System.out.println("Operador: " + yytext());}
{delimiters}	{System.out.println("DELIMITER: " + yytext());}
    
/* Insira as regras l�xicas no espa�o acima */     
     
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
