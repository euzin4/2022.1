	.data
campo:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
tam11:	.word	64
tam12:	.word	8
tam21:	.word	100
tam22:	.word	10
tam31:	.word	144
tam32:	.word	12
txt1:	.asciz	"selecione o tamanho do campo: \n1)8x8 \n2)10x10 \n3)12x12\n"
ql:	.asciz	"\n"

	.text
main:
	la a0,txt1
	li a7,4
	ecall		#printa o txt1
	
	#jal insere_bombas
	
	jal mostraCampo
	
mostraCampo:
	li t0,0		#contador
	
