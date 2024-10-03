.data 71; @ memoria donde empiezan los datos;

vector: .ascii16 'CARLOTA MONCASI.' ; char16_t letra1=0x0043;0x0041;0x0052;0x004c; 0x004f; 0x0054; 0x0041; 0x0020; 0x004d; 0x004f; 0x004e; 0x0043; 0x0041; 0x0053; 0x0049; 0x002e;
cero: .dw 0 ; 							constante 0;
letra: .rw; 							char letra(la declara para inicializarla después);
const: .dw 128 ; 						const INST(constante para recorrer posiciones del vector);

.data 127 ; @ memoria para imprimir en tty;

tty_out: .rw 1;


.code 

mov cero, tty_out ; 					borrar_pantalla();
mov vector, letra; 						letra=vector[i];
WHILE: cmp vector, '.'; 				while(vector='.');
beq HALT; 								salta al final si vector='.' porque se ha acabado;
mov letra, tty_out ; 					cout << letra, imprimir(letra);
add const, inst; 						i=i++ (pasa a la sig componente del vector);
INST: mov vector, letra;			 	letra=vector[i]; 
cmp cero, cero; 						while(0=0),salto incondicional;
beq WHILE; 								salto a while;
HALT: cmp cero, cero ; 					halt(); while(0=0),salto incondicional;
beq HALT ;
.end