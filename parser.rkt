#lang brag

drill        : introduction require? (description | question)*
description  : "@description" STRING lines
question     : "@question" IDENTIFIER STRING lines require? answer input
answer       : "@answer" IDENTIFIER sexprs
input        : "@input" sexprs
require      : "@require" sexprs
introduction : lines
lines        : LINE*
sexprs       : LINE*





