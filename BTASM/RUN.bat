@echo off

TASM.EXE %1.ASM
TLINK.EXE %1.OBJ
%1.EXE

echo .

:eof