parser grammar Raven;
options { tokenVocab=RavenLexer; }

program
    : namegroupDeclaration* EOF
    ;

namegroupDeclaration
    : NAMEGROUP qualifiedName LBRACE classDeclaration* RBRACE
    ;

qualifiedName
    : IDENTIFIER (DOT IDENTIFIER)*
    ;

classDeclaration
    : accessModifier? CLASS IDENTIFIER LBRACE memberDeclaration* RBRACE
    ;

memberDeclaration
    : fieldDeclaration
    | methodDeclaration
    | propertyDeclaration
    ;

accessModifier
    : PUBLIC 
    | PRIVATE 
    ;

fieldDeclaration
    : accessModifier? CONST? type IDENTIFIER ASSIGN expression SEMI
    | accessModifier? CONST? type IDENTIFIER SEMI
    ;

methodDeclaration
    : accessModifier? type IDENTIFIER PARENL parameterList? PARENR block
    ;

propertyDeclaration
    : accessModifier? type IDENTIFIER LBRACE GET SEMI SET SEMI RBRACE
    ;

parameterList
    : parameter (COMMA parameter)*
    ;

parameter
    : type IDENTIFIER
    ;

type
    : INT 
    | FLOAT 
    | STRING 
    | BOOL 
    | VOID 
    | IDENTIFIER
    ;

block
    : LBRACE statement* RBRACE
    ;

statement
    : block
    | variableDeclaration
    | ifStatement
    | whileStatement
    | returnStatement
    | expressionStatement
    ;

variableDeclaration
    : CONST? type IDENTIFIER ASSIGN expression SEMI
    | CONST? type IDENTIFIER SEMI
    ;

ifStatement
    : IF PARENL expression PARENR statement (ELSE statement)?
    ;

whileStatement
    : WHILE PARENL expression PARENR statement
    ;

returnStatement
    : RETURN expression? SEMI
    ;

expressionStatement
    : expression SEMI
    ;

expression
    : expression PIPE expression
    | expression (MULTI | DIVIS) expression
    | expression (PLUS | MINUS) expression
    | expression (LESSER | GREATER | LESSEREQUAL | GREATEREQUAL) expression
    | expression (EQUAL | NOTEQUAL) expression
    | expression AND expression
    | expression OR expression
    | NOT expression
    | IDENTIFIER ASSIGN expression
    | primary
    ;

primary
    : INT_LITERAL
    | STRING_LITERAL
    | BOOL_LITERAL
    | IDENTIFIER PARENL argumentList? PARENR
    | IDENTIFIER
    | PARENL expression PARENR
    ;

argumentList
    : expression (COMMA expression)*
    ;