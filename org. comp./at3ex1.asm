'''Exercício 1) Implemente uma função utilizando o conjunto de instruções RISC-V R32IM que realiza o swap entre duas posições de um vetor de inteiros. A função tem o seguinte protótipo:

void swap(int & vet, int indice_1, int indice_2);

os parâmetros da função (&vet, indice_1, indice_2) são passados, respectivamente, nos registradores a0 até a2.

Exemplo:
Considerando int vetor[7] = {-10, 8, 11, 16, 15, -6, 22}
ao chamar a função swap com a0 = &vet, a1 = 5 e a2 = 1, ao encerrar a execução da função teremos o vetor assim
vetor[7] = {-10, -6, 11, 16, 15, 8, 22}'''

.data
vetor1:	.word	9, 8, 7, 6, 5, 4, 3, 2, 1
vetor2: .word	-10, 8, 11, 16, 15, -6, 22


	.text
	
main:
	la 	a0, vetor1
	li 	a1, 8
	li 	a2, 0
	jal	swap
	
	li 	a7, 10   # chamada de sistema para encerrar programa
	ecall 
	
#####################################
# Implemente a função abaixo	
swap:
	jal print
	
	slli t0,a1,2
	add t1,a0,t0
	
	
	ret
	
print:
	li a7,1
	
