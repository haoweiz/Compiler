#include <stdio.h>
#include "myscanner.h"

extern int yylex();
extern char* yytext;
extern int lineNumber;
extern int columnNumber; 

int main(void){
    int token, text;
    token = yylex();
    while(token){
        printf("%3d %s %d %d\n", token, yytext, lineNumber, columnNumber);
        token = yylex();
    }
    return 0;
}
