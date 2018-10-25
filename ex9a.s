.data
CR: .word32 0x10000 ; $s0
DT: .word32 0x10008 ; $s1

.code
main:

	lwu $s0, CR($zero) ; guardar em memoria o controlo
	lwu $s1, DT($zero) ; e dados
	
	daddi $s2, $zero, 8 ; codigo para pedir numero
	daddi $s3, $zero, 2 ; codigo para mostrar numero
	
	sd $s2, ($s0) ; pedir numero A
	ld $a0, ($s1) ; guardar numero A nos argumentos
	
	sd $s2, ($s0) ; pedir numero B
	ld $a1, ($s1) ; guardar numero B nos argumentos
	
	jal Max
	
	sd $v0, ($s1)
	sd $s3, ($s0)
	
	
	halt
	

Max:
	
	daddi $t0, $zero, 1 ; valor 1 para comparar com o maior
	slt $t1, $a0, $a1 ; se o A for menor que o B $t1 vai ficar 1
	beq $t1, $t0, aMenor
	dadd $v0, $zero, $a0
	
	j fim
	
	
aMenor:
	dadd $v0, $zero, $a1
	
	
fim:
	jr $ra