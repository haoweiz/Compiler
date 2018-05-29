%{
#include "myscanner.h"
#include <stdio.h>
extern int yylex();
extern char* yytext;
extern int yyleng;
int lineNumber = 1;
int columnNumber = 1; 
%}

%%
"integer"		return T_INTEGER;
"real"			return T_REAL;
"Boolean"		return T_BOOLEAN;
"character"		return T_CHARACTER;
"string"		return T_STRING;

"null"			return NULL_PTR;
"reserve"		return RESERVE;
"release"		return RELEASE;
"for"			return FOR;
"while"			return WHILE;
"if"			return IF;
"then"			return THEN;
"else"			return ELSE;
"switch"		return SWITCH;
"case"			return CASE;
"otherwise"		return OTHERWISE;
"type"			return TYPE;
"function"		return FUNCTION;
"closure"		return CLOSURE;
"true"			return C_TRUE;
"false"			return C_FALSE;

"("			return L_PARENTHESIS;
")"			return R_PARENTHESIS;
"["			return L_BRACKET;
"]"			return R_BRACKET;
"{"			return L_BRACE;
"}"			return R_BRACE;
"\'"			return S_QUOTE;
"\""			return D_QUOTE;

";"			return SEMI_COLON;
":"			return COLON;
","			return COMMA;
"->"			return ARROW;
"\\"			return BACKSLASH;

"+"			return ADD;
"-"			return SUB_OR_NEG;
"*"			return MUL;
"/"			return DIV;
"%" 			return REM;
"." 			return DOT;
"<" 			return LESS_THAN;
"=" 			return EQUAL_TO;
":=" 			return ASSIGN;
"i2r" 			return INT2REAL;
"r2i" 			return REAL2INT;
"isNull" 		return IS_NULL;
"!" 			return NOT;
"&" 			return AND;
"|"			return OR;

[a-zA-Z][_a-zA-Z0-9]*				return ID;
"(\*"([^*]|[ \t\n])*"\*)"			return COMMENT;
('+'|'-')?[1-9][0-9]*				return C_INTEGER;
('+'|'-')?[0-9]+"."[0-9]+(('e'|'E')[0-9]+)?	return C_REAL;
"\'"[a-zA-Z]"\'"				return C_CHARACTER;
"\""[a-zA-Z]*"\""				return C_STRING;

\n			{ lineNumber++; columnNumber = 1;}
[ \t]*			{ columnNumber += yyleng; };
.			printf("Unknown character");
%%

int yywrap(void){
    return 1;
}

