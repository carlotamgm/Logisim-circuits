.data 71; @ memoria donde empiezan los datos;

vector: .ascii16 'CARLOTA MONCASI.' ; char16_t letra1=0x0043;0x0041;0x0052;0x004c; 0x004f; 0x0054; 0x0041; 0x0020; 0x004d; 0x004f; 0x004e; 0x0043; 0x0041; 0x0053; 0x0049; 0x002e;
cero: .dw 0;                     constante cero;
letra: .rw; 				char letra;
const: .dw 128 ; const INST(constante para recorrer posiciones del vector);

cminus: .dw 32; constante para pasar de cÃ³digo ascii en mayúscula al de minÃºscula, es una diferencia de 20 (32 en hexadecimal);

anterior: .dw 32; constante que guarda la letra anterior a la actual;

unidades: .ascii16 '0'; 0x30 que es '0';
decenas: .ascii16 '0'; 0x30 que es '0';
uno: .dw 1;
nueve: .ascii16 '9'; 0x39 máximo dígito de 1 cifra;
ceroascii: .ascii16 '0'; 0x30 que es '0';

.data 127 ; @ memoria para imprimir en tty;

tty_out: .rw 1;

.code 

mov cero, tty_out ; 					borrar_pantalla();
mov vector, letra; 					letra=vector[i];
b PANTALLA; 			   imprimir inicial en mayúscula;
WHILE: cmp vector, '.'; 				while(vector='.');
beq CUENTA;			    salta al final para escribirlo;
cmp letra, ' ';                     if(letra=' '); 
beq PANTALLA;     si es un espacio, se queda como está y se escribe por pantalla;
add cminus, letra;  letra+=32; la letra se 	vuelve minúscula;
PANTALLA: mov letra, tty_out ;      		   cout << letra;
add const, inst; 					           i=i++;
cmp unidades, nueve;                          if(unidades==9);
beq DEC;                    	salta a suma if(unidades!=9);
add uno, unidades;                    			unidades++;
INST: mov vector, letra;			 	  letra=vector[i]; 
cmp anterior, ' ';					if(anterior==' ');
beq PANTALLA; si el anterior era un espacio, salta a PANTALLA;
b WHILE; 					salto incondicional al WHILE;
DEC: mov ceroascii, unidades;                      unidades=0;
add uno, decenas;                                   decenas++;
b INST;					  salto incondicional a INST;
CUENTA: mov decenas, tty_out;                  cout<< decenas;
mov unidades, tty_out;                     cout << unidades;
HALT: b HALT ;		halt(); salto incondicional;
.end

