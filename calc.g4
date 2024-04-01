grammar calc;

// Parser rules
equation : expr EOF;

expr : '(' expr_list ')' 
     | NUMBER 
     | MEM
     | expr MATHOP expr 
     | MOP expr 
     | expr MOP
     | expr_list MATHOP
     ;

expr_list : expr+;

// Lexer rules
DIV : '/';
POW : '^';
PLUS : '+';
MULT : '*';
MINUS : '-';
LPAREN : '(';
RPAREN : ')';
RES : 'res' | 'RES';
MEM : 'mem' | 'MEM';
WS : [ \t\n\r]+ -> skip;
NUMBER : ('0' .. '9')+ ('.' ('0' .. '9')+)?;
MATHOP : DIV | POW | PLUS | MULT | MINUS;
MOP : RES | MEM;
