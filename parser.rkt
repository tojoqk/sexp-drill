#lang brag

%%drill        : %%introduction (%%description | %%question)*
%%description  : "@description" STRING %%containts
%%question     : "@question" IDENTIFIER STRING %%containts %%require? %%answer %%test
%%answer       : "@answer" %%sexprs
%%test         : "@test" IDENTIFIER %%sexprs
%%require      : "@require" %%sexprs
%%introduction : %%containts
%%containts    : LINE*
%%sexprs       : LINE*
