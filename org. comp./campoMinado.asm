#calculo para encontrar o valor no vetor '(nmro_linha * qtd_colunas) + nmro_coluna = posiçao no vetor'
	
	.data
campo:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
tam1:	.word	8
tam2:	.word	10
tam3:	.word	12
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
	
