/*Eduardo Henrique Giroto*/
/* Nao usar a biblioteca do flex*/
%option noyywrap
%x COMMENT

%{
#include <stdio.h>
#include <string.h>
#include <main.tab.h>
#define tamanho 100000
char vet[tamanho];
char vet2[tamanho];
int chars = 0;
int words = 0;
int lines = 1;
int erro_sint = 0;
int comment_lines = 0;
int lgc = 0;
int end = 0;
int varcoluna = 0;
%}

%%
"break"                       {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(BREAK);}
"switch"                      {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(SWITCH);}
"case"                        {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(CASE);}
"default"                     {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(DEFAULT);}
"typedef"                     {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(TYPEDEF);}
"struct"                      {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(STRUCT);}
"->"                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(POINTER);}
"void"                        {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(VOID);}
"int"                         {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(INT);}
"char"                        {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(CHAR);}
"return"                      {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(RETURN);}
"do"                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(DO);}
"while"                       {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(WHILE);}
"for"                         {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(FOR);}
"if"                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(IF);}
"else"                        {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(ELSE);}
"+"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(PLUS);}
"-"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(MINUS); }
"*"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(MULTIPLY);}
"/"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(DIV);}
"%"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(REMAINDER); }
"++"                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(INC);}
"--"                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(DEC);}
"&"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(BITWISE_AND);}
"|"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(BITWISE_OR);}
"~"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(BITWISE_NOT);}
"^"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(BITWISE_XOR);}
"!"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(NOT);}
"&&"                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(LOGICAL_AND);}
"||"                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(LOGICAL_OR);}
"=="                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(EQUAL);}
"!="                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(NOT_EQUAL);}
"<"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(LESS_THAN);}
">"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(GREATER_THAN);}
"<="                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(LESS_EQUAL);}
">="                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(GREATER_EQUAL);}
">>"                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(R_SHIFT);}
"<<"                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(L_SHIFT);}
"="                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(ASSIGN);}
"+="                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(ADD_ASSIGN);}
"-="                          {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(MINUS_ASSIGN);}
";"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(SEMICOLON);}
","                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(COMMA);}
":"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(COLON);}
"("                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(L_PAREN);}
")"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(R_PAREN);}
"{"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(L_CURLY_BRACKET);}
"}"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(R_CURLY_BRACKET);}
"["                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(L_SQUARE_BRACKET);}
"]"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(R_SQUARE_BRACKET);}
"?"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(TERNARY_CONDITIONAL);}
"#"                           {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(NUMBER_SIGN);}
"printf"                      {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(PRINTF);}
"scanf"                       {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(SCANF);}
"define"                      {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(DEFINE);}
"exit"                        {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(EXIT);}


" "                            {chars++; strcat(vet2,yytext);}
[\n]                           {lines++; chars=0; if(erro_sint == 1){vet2[strlen(vet2)] = '\n';}else{ vet2[0]='\0';}}
"//".*[\n]?                     {lines++; varcoluna = chars; strcat(vet2,yytext); }
"/*"                           {BEGIN(COMMENT); strcat(vet2,yytext);}
<COMMENT>"*/"                  {BEGIN(INITIAL); strcat(vet2,yytext);}
<COMMENT>([^*]|\n)+|.          {int i; strcat(vet2,yytext); comment_lines = lines; chars+=2; for(i=0; i<strlen(yytext); i++) {words++; chars++; if (yytext[i] == '\n') { lines++; chars = 0;}} chars+=1; varcoluna = chars;}
<COMMENT><<EOF>>               {if (lgc > 0) printf("\n");  printf("error:lexical:%d:%d :unterminated comment", comment_lines, chars+1); lgc = 1; varcoluna = chars; exit(1); return 0;}
0[1-7]+[0-7]*                {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(NUM_OCTAL); }
0[x|X]([0-9]+|[a-fA-F]+)+       {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(NUM_HEXA); }
[0-9]+                         {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(NUM_INTEGER);}
[_?a-zA-Z]+[0-9]*              {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(IDENTIFIER);}
[\t]                           {}
[\']("\n"|"\t"|"\0"|"\a")[\']    {strcat(vet2,yytext); strcpy(vet,yytext); chars+=2; words++; return(CHARACTER);}
[\'].[\']                    {strcat(vet2,yytext); strcpy(vet,yytext); chars++; words++; return(CHARACTER);}
[\"].*[\"]                   {strcat(vet2,yytext); strcpy(vet,yytext); chars += strlen(yytext); words++; return(STRING);}
.                              {if (lgc > 0) printf("\n"); printf("error:lexical:%d:%d: %s",lines,chars+1,yytext); words++; lgc = 1; exit(0);}
<<EOF>>                        {if(end==0){end = 1; vet2[strlen(vet2)] = '\0';} return(END_FILE);}
%%
