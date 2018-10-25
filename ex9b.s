.data
CR: .word32 0x10000 ; $s0
DT: .word32 0x10008 ; $s1

.code
main:

	daddi $sp, $zero, 0x200 ; inicializar a pilha

	lwu $s0, CR($zero) ; guardar em memoria o controlo
	lwu $s1, DT($zero) ; e dados
	
	daddi $s2, $zero, 8 ; codigo para pedir numero
	daddi $s3, $zero, 2 ; codigo para mostrar numero
	
	sd $s2, ($s0) ; pedir numero A
	ld $s4, ($s1) ; guardar numero A nos argumentos
	
	sd $s2, ($s0) ; pedir numero B
	ld $s5, ($s1) ; guardar numero B nos argumentos
	
	daddi $sp, $sp, -16 ; definir o tamanho para utilizar na pilha
	sd $s4, ($sp) ; guardar o primeiro numero na posição mais em baixo
	sd $s5, 8($sp) ; guardar o segundo numero na posição mais alta na pilha
	
	jal Max ; salta para a função
	
	daddi $sp, $sp, 16 ; liberta a pilha
	
	sd $v0, ($s1)
	sd $s3, ($s0)
	
	
	halt
	

Max:
	
	ld $t2, ($sp) ; vai buscar o A a posicao mais baixa da pilha
	ld $t3, 8($sp) ; vai buscar o B na segunda posicao mais baixa da pilha
	
	daddi $t0, $zero, 1 ; valor 1 para comparar com o maior
	slt $t1, $t2, $t3 ; se o A for menor que o B $t1 vai ficar 1
	beq $t1, $t0, aMenor
	dadd $v0, $zero, $t2
	
	j fim
	
	
aMenor:
	dadd $v0, $zero, $t3
	
	
fim:
	jr $ra