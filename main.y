%{

%}

%%

  programa: declaracoes prog
          | funcao prog
  ;

  prog: programa
      |
  ;

  declaracoes: NUMBER_SIGN DEFINE IDENTIFIER expressao
             | declaracao_variavel
             | declaracao_prototipo
  ;

  funcao: tipo funcao2
  ;

  funcao2: MULTIPLY funcao2
         | IDENTIFIER parametros L_CURLY_BRACKET comandos R_CURLY_BRACKET
         | IDENTIFIER parametros L_CURLY_BRACKET declaracao_variavel funcao3
  ;

  funcao3: declaracao_variavel funcao3
          | comandos R_CURLY_BRACKET
  ;

  declaracao_variavel: tipo decvar2

  ;

  decvar2: MULTIPLY decvar2
         | IDENTIFIER decvar3
  ;

  decvar3: decvar4
       |
  ;

  decvar4: L_SQUARE_BRACKET expressao R_SQUARE_BRACKET decvar4
         | ASSIGN exp_atrib decvar5
         | decvar5
  ;

  decvar5: SEMICOLON
         | COMMA decvar2
  ;
%%
