.data
CR: .word32 0x10000 ; r1
DT: .word32 0x10008 ; r2

String: .space 100
StringMostrar: .space 20
QuebraLinha: .asciiz "\n"

.code
	
	daddi r20, r0, 8 ; codigo para pedir numero
	daddi r21, r0, 6 ; codigo para limpar o terminal
	daddi r22, r0, 4 ; codigo para mostrar mensagem
	daddi r23, r0, 2 ; codigo para mostrar numero
	daddi r24, r0, 9 ; codigo para pedir um caracter
	
	daddi r13, r0, 13 ; código para letra ENTER
	
	daddi r14, r0, 0 ; contador para guardar no vetor
	
	lwu r1, CR(r0) ; guardar em memoria o controlo
	lwu r2, DT(r0) ; e dados
	
	
ciclo:

	sd r24, (r1)
	lb r10, (r2)
	
	beq r10, r13, fim
	
	sb r10, String(r14)
	
	sb r10, StringMostrar(r0)
	
	daddi r11, r0, StringMostrar
	
	sd r11, (r2)
	sd r22, (r1)
	
	daddi r14, r14, 1
	
	j ciclo
	
fim:

	daddi r11, r0, QuebraLinha
	sd r11, (r2)
	sd r22, (r1)
	
	daddi r11, r0, String
	sd r11, (r2)
	sd r22, (r1)
	
	halt

	