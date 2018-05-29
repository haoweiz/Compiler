#include <stdio.h>
#include "myscanner.h"

extern int yylex();
extern char* yytext;
extern int yyleng;
extern int lineNumber;
extern int columnNumber; 

int main(void){
    int token, text;
    token = yylex();
    while(token){
        printf("%3d %s %d %d\n", token, yytext, lineNumber, columnNumber);
        if(token == COMMENT || token == C_STRING){
            int pos = 0;
            while(yytext[pos] != '\0'){
                if(yytext[pos] == '\n')
                    lineNumber++;
                pos++;
            }
        }
        columnNumber = columnNumber + yyleng;
        token = yylex();
    }
    return 0;
}
