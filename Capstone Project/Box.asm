
// Box.asm - K = 59
// Box: starts at row 59, 20 rows tall,
// 64 pixels (4 words) wide, left edge.
// Row 59 starts at 16384 + 32*59 = 18272.
// Key pressed -> black box; key released -> box cleared.

(MAIN)
    @KBD
    D=M
    @PRESSED
    D;JNE

    @color
    M=0
    @DRAW
    0;JMP

(PRESSED)
    @color
    M=-1

(DRAW)
    @18272
    D=A
    @addr
    M=D

    @20
    D=A
    @rows
    M=D

(ROWLOOP)
    @addr
    D=M
    @ptr
    M=D

    @4
    D=A
    @cols
    M=D

(COLLOOP)
    @color
    D=M
    @ptr
    A=M
    M=D

    @ptr
    M=M+1

    @cols
    M=M-1
    D=M
    @COLLOOP
    D;JGT

    @32
    D=A
    @addr
    M=D+M

    @rows
    M=M-1
    D=M
    @ROWLOOP
    D;JGT

    @MAIN
    0;JMP
