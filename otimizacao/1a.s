		.data
i:		.word	0
C:		.word	7
A:		.space	800
B:		.space	800

		.text

	DADDI	R1,R0,0	 
	SD	R1, i(R0)
	
loop:

	LD	R1,i(R0)
	DADDI	R9,R0,8	
	DMUL	R2,R1,R9

	LD	R4,B(R2) 
	LD	R5,C(R0)

	DADD	R6,R4,R5	

	LD	R1,i(R0)	
	DADDI	R9,R0,8		
	DMUL	R2,R1,R9	
	SD	r6,A(r2)

	LD	R1,i(R0)	
	DADDI	R1,R1,1		
	SD	r1,i(R0)	

	LD	R1,i(R0)		
	DADDI	R8,R1,-100	
	BNEZ	R8,loop		 

	halt 
