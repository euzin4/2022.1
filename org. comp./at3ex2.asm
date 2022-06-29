	.data
vetor1:	.word	9, 8, 7, 6, 5, 4, 3, 2, 1
vetor2: .word	-10, 8, 11, 16, 15, -6, 22
esp:	.asciz	" "
ql:	.asciz	"\n"

	.text
	
main:
	la 	s1, vetor1
	li 	a1, 8
	li 	a2, 0
	li	a3, 9	#tamanho do vetor
	jal	shift
	
	#---quebra de linha
	la a0,ql
	li a7,4
	ecall
	#---quebra de linha
	la a0,ql
	li a7,4
	ecall
	
	la 	s1, vetor2
	li 	a1, 5
	li 	a2, 1
	li	a3, 7	#tamanho do vetor
	jal	shift

	li 	a7, 10   # chamada de sistema para encerrar programa
	ecall 
	
#####################################
# Implemente a funÃ§Ã£o abaixo	

shift:
	add s10,ra,zero	#copia o endereço de ret do 'jal swap', é necessario antes de outro jal
	jal print
	add ra,s10,zero	#retorna o endereço do 'jal swap'
	
	
	
	#---quebra de linha
	la a0,ql
	li a7,4
	ecall
	
	add s10,ra,zero	#copia o endereço de ret do 'jal swap', é necessario antes de outro jal
	jal print
	add ra,s10,zero	#retorna o endereço do 'jal swap'
	
#---print
print:
	li t6,0	#zera o contador do loop
	addi a4,a3,1
	
loop:
	slli t5,t6,2	#converte o indice em "endereço" para deslocamento
	add t5,s1,t5	#endereço completo para o deslocamento
	li a7,1	#para ecall de imprimir inteiros
	lw a0,0(t5)
	ecall
	la a0,esp
	li a7,4
	ecall
	
	addi t6,t6,1	#somador do contador
	bne t6,a4,loop	#condicional de loop
	ret
#---fim print