lexer grammar RavenLexer;

NAMEGROUP: 'namegroup';
CLASS: 'class';
PUBLIC: 'public';
PRIVATE: 'private';
INT: 'int';
FLOAT: 'float';
STRING: 'string';
BOOL: 'bool';
VOID: 'void';
IF: 'if';
ELSE: 'else';
WHILE: 'while';
RETURN: 'return';
GET: 'get';
SET: 'set';
CONST: 'const';

AND: 'and';
OR: 'or';
NOT: 'not';


LBRACE: '{';
RBRACE: '}';
DOT: '.';
ASSIGN: '=';
SEMI: ';';
PARENL: '(';
PARENR: ')';
COMMA: ',';
MULTI: '*';
DIVIS: '/';
PLUS: '+';
MINUS: '-';
LESSER: '<';
GREATER: '>';
LESSEREQUAL: '<=';
GREATEREQUAL: '>=';
EQUAL: '==';
NOTEQUAL: '!=';
PIPE: '|>';


BOOL_LITERAL
    : 'true' | 'false'
    ;

IDENTIFIER
    : [a-zA-Z_][a-zA-Z0-9_]*
    ;

INT_LITERAL
    : [0-9]+
    ;

STRING_LITERAL
    : '"' (~["\r\n])* '"'
    ;


WS
    : [ \t\r\n]+ -> skip
    ;

LINE_COMMENT
    : '//' (~[\r\n])* -> skip
    ;

BLOCK_COMMENT
    : '/*' .*? '*/' -> skip
    ;