.MODEL large
.DATA
    EXTRN _n:word;
.CODE
    PUBLIC @GIAITHUA$qv
    @GIAITHUA$qv PROC
        mov CX,_n
        mov AX,1
        cmp CX,2
        jb L3
    L2:
        mul CX
        loop L2
    L3:
        ret
    @GIAITHUA$qv ENDP
END