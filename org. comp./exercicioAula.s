#	S=((A-C)*B)/C-B
	
	.data
A:	.word 12
B:	.word 23
C:	.word 43
D:	.word 23
S:	.word 0

	.text
main:
	lw t1,A		#12
	lw t2,B		#23
	lw t3,C		#43
	lw t4,D		#23
	sub s1,t3,t2	#C-B
	sub s2,t1,t3	#A-C
	mul s3,s1,t4	#(A-C)*B
	div s4,s3,s1	#S
	la t5,S		#salva em t5 o endereço de memoria de S
	sw s4,0(t5)	#salva o resultado no endereço de S
