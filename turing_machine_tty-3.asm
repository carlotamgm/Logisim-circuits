.data 71; @ memoria donde empiezan los datos;

vector: .ascii16 'CARLOTA MONCASI.' ; char16_t letra1=0x0043;0x0041;0x0052;0x004c; 0x004f; 0x0054; 0x0041; 0x0020; 0x004d; 0x004f; 0x004e; 0x0043; 0x0041; 0x0053; 0x0049; 0x002e;
cero: .dw 0 ; 				constante 0;
letra: .rw; 				char letra(la declara para inicializarla después);
const: .dw 128 ; 			const INST(constante para recorrer posiciones del vector, 80 en hexadecimal);
cminus: .dw 32; 			constante para pasar de código ascii en mayúscula al de minúscula, es una 
							diferencia de 20 (32 en hexadecimal);
anterior: .dw 32; 			constante que guarda la letra anterior a la actual;

.data 127 ; @ memoria para imprimir en tty;

tty_out: .rw 1;

.code 

	mov cero, tty_out ;                 borrar_pantalla();
	mov vector, letra;                  letra=vector[i];
	cmp cero, cero;                     while(0=0) salto 										incondicional;
	beq PANTALLA;                       la primera letra se 	mantiene mayúscula y se escribe por pantalla;
WHILE: cmp letra, '.';             while(letra='.');
	beq PUNTO;      salta al final si letra='.' porque se ha 									acabado el programa;
	cmp letra, ' ';                     if(letra=' '); 
	beq PANTALLA;                       si es un espacio, se 					queda como está y se escribe por pantalla;
	add cminus, letra;                  letra+=32; la letra se 									vuelve minúscula;
PANTALLA: mov letra, tty_out ;      cout << letra, 										imprimir(letra);
	mov letra, anterior;                anterior=letra; guarda 	la letra en una 	const "anterior" antes de pasar a
									la siguiente;
	add const, inst;                    i=i++ (pasa a la sig 							componente del vector);
INST: mov vector, letra;            letra=vector[i]; 
	cmp anterior, ' ';                  if(anterior=' ');
	beq PANTALLA;                       si la letra anterior era 			un espacio, mantiene esta letra actual mayúscula 							y la escribe por pantalla;
	cmp cero, cero;                     while(0=0),salto 										incondicional;
	beq WHILE;                          salto al primer while;
PUNTO: mov letra, tty_out;				escribe el punto '.';
HALT: cmp cero, cero ;              halt(); while(0=0),salto 										incondicional;
	beq HALT ;
.end

