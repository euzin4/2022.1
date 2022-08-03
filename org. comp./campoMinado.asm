#calculo para encontrar o valor no vetor '(nmro_linha * qtd_colunas) + nmro_coluna = posiçao no vetor'
	
	.data
campo:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
campoi:	.asciz 	"-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"
tam1:	.word	8
tam2:	.word	10
tam3:	.word	12
txt1:	.asciz	"selecione o tamanho do campo: \n1)8x8 \n2)10x10 \n3)12x12\n"
txt2:	.asciz	"Tamanho incorreto\n"
ql:	.asciz	"\n"

	.text
main:
	la a0,txt1
	li a7,4
	ecall		#printa a escolha de tamanho
	li a7,5
	ecall		#entrada de dados pelo usuario
	li t0,4
	li t1,1
	blt a0,t1,erroTam
	bge a0,t0,erroTam
	j menu
	
erroTam:
	#txt2
	#volta pro main(escolha de tamanho)
	
	#jal insere_bombas
	
	
menu:
	jal mostraCampo	
	
mostraCampo:
	la a0,campoi	#guarda o endereço de 'campoi'
	li t0,0		#contador
	li a7,4		#ecall para print de string
	
loopmcl:
	
