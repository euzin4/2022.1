#calculo para encontrar o valor no vetor '(nmro_linha * qtd_colunas) + nmro_coluna = posiçao no vetor'
	
	.data
campo:	.word	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
tam1:	.word	8
tam2:	.word	10
tam3:	.word	12
campoi:	.asciz 	"-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-"
txt1:	.asciz	"selecione o tamanho do campo: \n1)8x8 \n2)10x10 \n3)12x12\n"
txt2:	.asciz	"Tamanho incorreto\n"
ql:	.asciz	"\n"
esp:	.asciz 	" "
#INSERE_BOMBA
salva_S0:	.word	0
salva_ra:	.word	0
salva_ra1:	.word	0

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
	
	jal tamCampo	#retorna o tamanho do campo em 's1'
	
	#INSERE_BOMBA
	la a0,campo	# endereço inicial do campo
	add a1,zero,s1	# quantidade de linhas do campo
	jal INSERE_BOMBA
	#jal calcula_bombas

	j menu
		
#=================inicio INSERE BOMBA
INSERE_BOMBA:
		la	t0, salva_S0
		sw  	s0, 0 (t0)		# salva conteudo de s0 na memoria
		la	t0, salva_ra
		sw  	ra, 0 (t0)		# salva conteudo de ra na memoria
		
		add 	t0, zero, a0		# salva a0 em t0 - endereÃ§o da matriz campo
		add 	t1, zero, a1		# salva a1 em t1 - quantidade de linhas 

QTD_BOMBAS:
		addi 	t2, zero, 15 		# seta para 15 bombas	
		add 	t3, zero, zero 	# inicia contador de bombas com 0
		addi 	a7, zero, 30 		# ecall 30 pega o tempo do sistema em milisegundos (usado como semente
		ecall 				
		add 	a1, zero, a0		# coloca a semente em a1
INICIO_LACO:
		beq 	t2, t3, FIM_LACO
		add 	a0, zero, t1 		# carrega limite para %	(resto da divisÃ£o)
		jal 	PSEUDO_RAND
		add 	t4, zero, a0		# pega linha sorteada e coloca em t4
		add 	a0, zero, t1 		# carrega limite para % (resto da divisÃ£o)
   		jal 	PSEUDO_RAND
		add 	t5, zero, a0		# pega coluna sorteada e coloca em t5
	
LE_POSICAO:	
		mul  	t4, t4, t1
		add  	t4, t4, t5  		# calcula (L * tam) + C
		add  	t4, t4, t4  		# multiplica por 2
		add  	t4, t4, t4  		# multiplica por 4
		add  	t4, t4, t0  		# calcula Base + deslocamento
		lw   	t5, 0(t4)   		# Le posicao de memoria LxC
VERIFICA_BOMBA:		
		addi 	t6, zero, 9		# se posiÃ§Ã£o sorteada jÃ¡ possui bomba
		beq  	t5, t6, PULA_ATRIB	# pula atribuiÃ§Ã£o 
		sw   	t6, 0(t4)		# senÃ£o coloca 9 (bomba) na posiÃ§Ã£o
		addi 	t3, t3, 1		# incrementa quantidade de bombas sorteadas
PULA_ATRIB:
		j	INICIO_LACO

FIM_LACO:					# recupera registradores salvos
		la	t0, salva_S0
		lw  	s0, 0(t0)		# recupera conteudo de s0 da memÃ³ria
		la	t0, salva_ra
		lw  	ra, 0(t0)		# recupera conteudo de ra da memÃ³ria		
		jr 	ra			# retorna para funcao que fez a chamada
		
PSEUDO_RAND:
		addi t6, zero, 125  		# carrega constante t6 = 125
		lui  t5, 682			# carrega constante t5 = 2796203
		addi t5, t5, 1697 		# 
		addi t5, t5, 1034 		# 	
		mul  a1, a1, t6			# a = a * 125
		rem  a1, a1, t5			# a = a % 2796203
		rem  a0, a1, a0			# a % lim
		bge  a0, zero, EH_POSITIVO  	# testa se valor eh positivo
		addi s2, zero, -1           	# caso nÃ£o 
		mul  a0, a0, s2		    	# transforma em positivo
EH_POSITIVO:	
		ret				# retorna em a0 o valor obtido
		
#==============================fim do INSERE BOMBA

#==============================inicio tamCampo
tamCampo:
	#se 'nmr digitado' == 'x' recebe o tamanho de determinado campo
	li t0,1
	beq a0,t0,tam8
	li t0,2
	beq a0,t0,tam10
	li t0,3
	beq a0,t0,tam12	
	#salva o tamanho do campo em s1
tam8:
	la t0,tam1
	lw s1,0(t0)		#8
	ret
tam10:
	la t1,tam2
	lw s1,0(t1)		#10
	ret
tam12:
	la t2,tam3
	lw s1,0(t2)		#12
	ret

#==============================fim tamCampo
#==============================inicio erroTam
erroTam:
	la a0,txt2
	li a7,4
	ecall		#mensagem de erro
	j main		#volta pra escolha de tamanho
#==============================fim erroTam

menu:
	jal mostraCampo
	#opçoes
	
	li a7,10
	ecall		#fim do programa
	
#==============================inicio mostraCampo
mostraCampo:
	la a0,campoi	#guarda o endereço de 'campoi'
	li t0,0		#contador linha
	li t1,0		#contador coluna
	
	la t2,esp
	li a7,4
	ecall
	ecall
loopNum:	#printa os numeros de indice (primeira linha)
	

#==============================fim mostraCampo
