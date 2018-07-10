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

  decvar3: L_SQUARE_BRACKET expressao R_SQUARE_BRACKET decvar3
         | ASSIGN exp_atrib decvar4
         | decvar4

  ;

  decvar4: SEMICOLON
         | COMMA decvar2
  ;

  declaracao_prototipo: tipo decprot2

  ;

  decprot2: MULTIPLY decprot2
          | IDENTIFIER parametros SEMICOLON
  ;

  parametros: L_PAREN param2

  ;

  param2: R_PAREN
        | param3
  ;

  param3: tipo param4

  ;

  param4: MULTIPLY param4
        | IDENTIFIER param5
  ;

  param5: COMMA param3
        | R_PAREN
        | L_SQUARE_BRACKET expressao R_SQUARE_BRACKET param5
  ;

  tipo: INT
      | CHAR
      | VOID
  ;

  bloco: L_CURLY_BRACKET comandos R_CURLY_BRACKET

  ;

  comandos: lista_comandos comandos2

  ;

  comandos2: comandos
           |
  ;

  lista_comandos: DO bloco WHILE L_PAREN expressao R_PAREN SEMICOLON
                | IF L_PAREN expressao R_PAREN bloco lista_comandos2
                | WHILE L_PAREN expressao R_PAREN bloco
                | FOR L_PAREN lista_comandos3
                | PRINTF L_PAREN STRING lista_comandos4
                | SCANF L_PAREN STRING COMMA BITWISE_AND IDENTIFIER R_PAREN SEMICOLON
                | EXIT L_PAREN expressao R_PAREN SEMICOLON
                | RETURN lista_comandos5
                | expressao SEMICOLON
                | SEMICOLON
                | bloco
  ;

  lista_comandos2: ELSE bloco
                 |
  ;

  lista_comandos3: expressao SEMICOLON ldc1
                 | SEMICOLON ldc1
  ;

  ldc1: expressao SEMICOLON ldc2
      | SEMICOLON ldc2
  ;

  ldc2: expressao R_PAREN ldc3
      | R_PAREN ldc3
  ;

  ldc3: bloco

  ;

  lista_comandos4: COMMA expressao R_PAREN SEMICOLON
                 | R_PAREN SEMICOLON
  ;

  lista_comandos5: expressao SEMICOLON
                 | SEMICOLON
  ;

  expressao: exp_atrib expressao2

  ;

  expressao2: COMMA expressao
            |
  ;

  exp_atrib: exp_cond
           | exp_unaria exp_atrib2
  ;

  exp_atrib2: ASSIGN exp_atrib
            | ADD_ASSIGN exp_atrib
            | MINUS_ASSIGN exp_atrib
  ;

  exp_cond: 






%%
