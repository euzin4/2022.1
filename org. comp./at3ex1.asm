#Exercício 1) Implemente uma função utilizando o conjunto de instruções RISC-V R32IM que realiza o swap entre duas posições de um vetor de inteiros. A função tem o seguinte protótipo:
#
#void swap(int & vet, int indice_1, int indice_2);
#
#os parâmetros da função (&vet, indice_1, indice_2) são passados, respectivamente, nos registradores s1 até a2.
#
#Exemplo:
#Considerando int vetor[7] = {-10, 8, 11, 16, 15, -6, 22}
#ao chamar a função swap com s1 = &vet, a1 = 5 e a2 = 1, ao encerrar a execução da função teremos o vetor assim
#vetor[7] = {-10, -6, 11, 16, 15, 8, 22}

		.data
vetor1:	.word	9, 8, 7, 6, 5, 4, 3, 2, 1
vetor2: .word	-10, 8, 11, 16, 15, -6, 22


	.text
	
main:
	la 	s1, vetor1
	li 	a1, 8
	li 	a2, 0
	li	a3, 8	#tamanho do vetor
	jal	swap
	
#	la 	s1, vetor2
#	li 	a1, 5
#	li 	a2, 1
#	li	a3, 6	#tamanho do vetor
#	jal	swap
	
	li 	a7, 10   # chamada de sistema para encerrar programa
	ecall 
	
#####################################
# Implemente a função abaixo	
swap:
	add s10,ra,zero	#endereço de ret do 'jal swap'
	jal print
	add ra,s10,zero	#retorna o endereço do 'jal swap'
	
	slli t0,a1,2
	add t1,s1,t0
	
	ret
	
print:
	li a7,1	#para ecall de imprimir inteiro
	li t6,0	#zera o contador do loop
	
loop:
	slli t5,t6,2	#converte o indice em "endereço" para deslocamento
	add t5,s1,t5	#endereço completo para o deslocamento
	lw a0,0(t5)
	ecall
	
	addi t6,t6,1	#somador do contador
	blt t6,a3,loop	#condicional de loop
	ret
