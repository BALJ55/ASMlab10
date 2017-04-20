@********************************************************
@ lab10.s
@ Autor1: Emilio Diaz
@ Autor2: Byron Mota
@ Fecha: 20/04/2016
@ Ingreso de notas, desplegar mayor
@********************************************************
@area del codigo
.global _start
_start:

  mov r9, #0 @@se mueve r9 con 0 para determinar si han ingresado o no todas las notas //0=false, 1=true
  @en r5 estan las operaciones char->int
  bl showmenu

showmenu:
  @Muestra el menú
  MOV R7, #4		@4=llamado a "write" swi
  MOV R0, #1		@1=stdout (monitor)
  MOV R2, #73		@longitud de la cadena: 73 caracteres
  LDR R1, =menuPpal	@apunta a la cadena
  SWI 0
  MOV R7, #1		@salida al sistema operativo
  SWI 0
  b getoption

getoption:
  @recibe la opcion ingresada por el usuario y la convierte a un numero
  MOV R7, #3		@3=llamado a "read" swi
  MOV R0, #0		@0=stdout (teclado)
  MOV R2, #1		@longitud de la cadena: 2 caracteres
  LDR R1, =getnote      @apunta a la variable donde se guarda
  SWI 0
  MOV R7, #1		@salida al sistema operativo
  ldr r0, [r1]
  sub r0, #0x30
  b sender
  
  
sender:
  @manda a la subritina adecuada en base al numero ingresado
  mov r1,#1
  cmp r0,r1
  beq fillnotas
  add r1,r1,#1
  cmp r0,r1
  beq mayor
  b salir



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

salir:
  MOV R7, #1		@salida al sistema operativo
  SWI 0

@-------------------------------------------------------------
@area de datos
  .data

  menuPpal: .asciz "Bienvenido al ingreso de notas/n1. Ingreso de notas/n2. Nota mayor/n3.Salir"
  option: .asciz "%d"
  notemsj .asciz "Ingrese la nota (00-99)/n"
  getnote .asciz "  "
  arregloNotas .word "  ","  ","  "