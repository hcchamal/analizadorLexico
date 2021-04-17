import java.lang.System;

class AnalizadorLexico {
      public static void main(String argv[])
	throws java.io.IOException {
	Yylex yy = new Yylex(System.in);
	while (yy.yylex() != null) {}	
    }
}

class Yytoken {
  Yytoken () {}
}
 
%%

%eofval{
  { System.exit(0); }
%eofval}

%line    
%char  

IDENTIFICADOR = [a-z|A-Z][a-z|A-Z|0-9|_]*
DIGITO = [0-9][0-9]*
ESPACIOS = [ \t\r\n]
COMENTARIO = #[a-z|A-Z|0-9| ]*


%%
 

<YYINITIAL> {ESPACIOS} 	{/*IGNORE*/} 
<YYINITIAL> {DIGITO} 	{ System.out.println ("DIGITO = [0-9][0-9]*, LEXEMA:" + yytext() );} 
<YYINITIAL> "set" 		{ System.out.println ("SET = SET, LEXEMA:" + yytext() );} 
<YYINITIAL> "puts" 		{ System.out.println ("PUTS = PUTS, LEXEMA:" + yytext() );} 
<YYINITIAL> "expr" 		{ System.out.println ("EXPR = EXPR, LEXEMA:" + yytext() );} 
<YYINITIAL> "if" 		{ System.out.println ("IF = IF, LEXEMA:" + yytext() );} 
<YYINITIAL> "then" 		{ System.out.println ("THEN = THEN, LEXEMA:" + yytext() );} 
<YYINITIAL> "elseif" 		{ System.out.println ("ELSEIF = ELSEIF, LEXEMA:" + yytext() );} 
<YYINITIAL> "else" 		{ System.out.println ("ELSE = ELSE, LEXEMA:" + yytext() );} 
<YYINITIAL> "switch" 		{ System.out.println ("SWITCH = SWITCH, LEXEMA:" + yytext() );} 
<YYINITIAL> "default" 		{ System.out.println ("DEFAULT = DEFAULT, LEXEMA:" + yytext() );} 
<YYINITIAL> "while" 		{ System.out.println ("WHILE = WHILE, LEXEMA:" + yytext() );} 
<YYINITIAL> "continue" 		{ System.out.println ("CONTINUE = CONTINUE, LEXEMA:" + yytext() );} 
<YYINITIAL> "break" 		{ System.out.println ("DEFAULT = DEFAULT, LEXEMA:" + yytext() );} 
<YYINITIAL> "for" 		{ System.out.println ("FOR = FOR, LEXEMA:" + yytext() );} 
<YYINITIAL> "proc" 		{ System.out.println ("PROC = PROC, LEXEMA:" + yytext() );} 
<YYINITIAL> "return" 		{ System.out.println ("RETURN = RETURN, LEXEMA:" + yytext() );} 
<YYINITIAL> "incr" 		{ System.out.println ("INCR = INCR, LEXEMA:" + yytext() );} 
<YYINITIAL> "$" 		{ System.out.println ("Sigo de dolar = $, LEXEMA:" + yytext() );} 
<YYINITIAL> "\"" 		{ System.out.println ("COMILLAS = \", LEXEMA:" + yytext() );} 
<YYINITIAL> "[\\]" 		{ System.out.println ("DIAGONAL INVERSA = \\, LEXEMA:" + yytext() );} 
<YYINITIAL> "{" 		{ System.out.println ("APERTURA DE LLAVE = {, LEXEMA:" + yytext() );} 
<YYINITIAL> "}" 		{ System.out.println ("CERRADURA DE LLAVE = }, LEXEMA:" + yytext() );} 
<YYINITIAL> "[" 		{ System.out.println ("APERTURA DE CORCHETE = [, LEXEMA:" + yytext() );} 
<YYINITIAL> "]" 		{ System.out.println ("CERRADURA DE CORCHETE = ], LEXEMA:" + yytext() );} 
<YYINITIAL> "+" 		{ System.out.println ("SIGNO MAS = +, LEXEMA:" + yytext() );} 
<YYINITIAL> "-" 		{ System.out.println ("SIGNO MENOS = -, LEXEMA:" + yytext() );} 
<YYINITIAL> "**" 		{ System.out.println ("EXPONENTE = **, LEXEMA:" + yytext() );} 
<YYINITIAL> "*" 		{ System.out.println ("ASTERISCO = *, LEXEMA:" + yytext() );} 
<YYINITIAL> "/" 		{ System.out.println ("DIAGONAL = /, LEXEMA:" + yytext() );} 
<YYINITIAL> "%" 		{ System.out.println ("PORCENTAJE = %, LEXEMA:" + yytext() );} 
<YYINITIAL> "<" 		{ System.out.println ("MENOR QUE = <, LEXEMA:" + yytext() );} 
<YYINITIAL> ">" 		{ System.out.println ("MAYOR QUE = >, LEXEMA:" + yytext() );} 
<YYINITIAL> "=" 		{ System.out.println ("IGUAL = =, LEXEMA:" + yytext() );} 
<YYINITIAL> "eq" 		{ System.out.println ("EQUALS = eq, LEXEMA:" + yytext() );} 
<YYINITIAL> "ne" 		{ System.out.println ("NOT EQUALS = ne, LEXEMA:" + yytext() );} 
<YYINITIAL> "in" 		{ System.out.println ("NOT EQUALS IN LIST = in, LEXEMA:" + yytext() );} 
<YYINITIAL> "&&" 		{ System.out.println ("AND = &&, LEXEMA:" + yytext() );} 
<YYINITIAL> "||" 		{ System.out.println ("OR = ||, LEXEMA:" + yytext() );} 
<YYINITIAL> "!" 		{ System.out.println ("NEGACION = !, LEXEMA:" + yytext() );} 

<YYINITIAL> {COMENTARIO} 		{ System.out.println ("COMENTARIO = #[a-z|A-Z][a-z|A-Z|0-9|_]*, LEXEMA:" + yytext() );} 

<YYINITIAL> {IDENTIFICADOR} 	{ System.out.println ("IDENTIFICADOR = [a-z|A-Z][a-z|A-Z|0-9|_]*, LEXEMA:" + yytext() );} 


.
  { 
    System.out.println("error lexico en "  + yyline + "," + yychar + " No se reconoce " + yytext());
    yychar=0;
  }