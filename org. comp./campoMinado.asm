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
#INSERE_BOMBA
salva_S0:	.word	0
salva_ra:	.word	0

	.text
main:	#escolha do tamanho do campo
	la a0,txt1	
	li a7,4
	ecall		#printa o menu de escolha de tamanho
	li a7,5
	ecall		#entrada de dados pelo usuario
	li t0,4
	li t1,1
	blt a0,t1,erroTam	#entrada<1 =erro
	bge a0,t0,erroTam	#entrada>=4 =erro
	la t0,tam1
	lw t0,0(t0)		#8
	la t1,tam2
	lw t1,0(t1)		#10
	la t2,tam3
	lw t2,0(t2)		#12
	#se 'nmr digitado' == 'x' recebe o tamanho de determinado campo
	#salvar o tamanho do campo em s1
	
	#INSERE_BOMBA
	#add	a1,zero,s1	# quantidade de linhas do campo
	la	a0,campo	# endereço inicial do campo
	#jal 	INSERE_BOMBA

	j menu
	
erroTam:
	la a0,txt2
	li a7,4
	ecall		#mensagem de erro
	j main		#volta pra escolha de tamanho
		
menu:
	jal mostraCampo
	#opçoes
	
mostraCampo:
	la a0,campoi	#guarda o endereço de 'campoi'
	li t0,0		#contador linha
	li t1,0		#contador coluna
	
loopmcl:	#linha
	
