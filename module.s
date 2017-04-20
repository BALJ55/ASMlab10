.text
 .align  2
 .global  module
 .type  main, %function
mayorInt: 
	 @Suponiendo que el primer numero esta en r0
	 @el segundo en r1
	 @el tercero en r2
	 push {lr}
	 cmp r0,r1
	 jge cmpseg1
	 jnge cmpseg2
	 cmpseg1:
	 cmp r0,r2
	 jge primeromayor
	 jnge tercero mayor 
	 cmpseg2:
	 cmp r1,r2
	 jge segundomayor
	 jnge terceromayor
 primeromayor:
	 mov r7, #4 
	 mov r0, #1
	 mov r2,#31
	 ldr r1,=primero
	 SWI 0 
	 mov r7,#1
	 SWI 0
	 b showmenu
 segundomayor:
	 mov r7, #4 
	 mov r0, #1
	 mov r2,#32
	 ldr r1,=segundo
	 SWI 0 
	 mov r7,#1
	 SWI 0
	 b showmenu
 terceromayor:
	 mov r7, #4 
	 mov r0, #1
	 mov r2,#31
	 ldr r1,=tercero
	 SWI 0 
	 mov r7,#1
	 SWI 0 
	 b showmenu
	 

fillnotas:
  @Llena las notas del arreglo

  @muestra el mensaje de ingreso de notas
  MOV R7, #4		@4=llamado a "write" swi
  MOV R0, #1		@1=stdout (monitor)
  MOV R2, #73		@longitud de la cadena: 11 caracteres
  LDR R1, =menuPpal	@apunta a la cadena
  SWI 0
  @llena la primera nota 
  MOV R7, #3		@3=llamado a "read" swi
  MOV R0, #0		@0=stdout (teclado)
  MOV R2, #11		@longitud de la cadena: 11 caracteres
  LDR R1, =arregloNotas	@apunta a la variable donde se guarda
  SWI 0
  
  @muestra el mensaje de ingreso de notas
  MOV R7, #4		@4=llamado a "write" swi
  MOV R0, #1		@1=stdout (monitor)
  MOV R2, #73		@longitud de la cadena: 11 caracteres
  LDR R1, =menuPpal	@apunta a la cadena
  SWI 0
  @llena la segunda nota 
  MOV R7, #3		@3=llamado a "read" swi
  MOV R0, #0		@0=stdout (teclado)
  MOV R2, #11		@longitud de la cadena: 11 caracteres
  LDR R1, =arregloNotas	@apunta a la variable donde se guarda
  add r1,r1,#4
  SWI 0
 
  @muestra el mensaje de ingreso de notas
  MOV R7, #4		@4=llamado a "write" swi
  MOV R0, #1		@1=stdout (monitor)
  MOV R2, #73		@longitud de la cadena: 11 caracteres
  LDR R1, =menuPpal	@apunta a la cadena
  SWI 0
  @llena la tercera nota 
  MOV R7, #3		@3=llamado a "read" swi
  MOV R0, #0		@0=stdout (teclado)
  MOV R2, #11		@longitud de la cadena: 11 caracteres
  LDR R1, =arregloNotas	@apunta a la variable donde se guarda
  add r1,r1,#4
  SWI 0
  add r9,r9,#1
  b showmenu

 
 
error:
 mov r0,#0
 
fin: 
 pop {pc}
.data
.align 2
primero: .asciz "El primer numero es el mayor \n"
segundo: .asciz "El segundo numero es el mayor \n"
tercero: .asciz "El tercer numero es el mayor \n"

