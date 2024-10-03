.data 71; @ memoria donde empiezan los datos;

vector: .ascii16 'CARLOTA MONCASI.' ; char16_t letra1=0x0043;0x0041;0x0052;0x004c; 0x004f; 0x0054; 0x0041; 0x0020; 0x004d; 0x004f; 0x004e; 0x0043; 0x0041; 0x0053; 0x0049; 0x002e;
cero: .dw 0 ; 							constante 0;
letra: .rw; 			char letra(la declara para inicializarla después);
const: .dw 128 ; 		INST(constante para recorrer posiciones del vector,
									80 en hexadecimal);
cminus: .dw 32; 		constante para pasar de código ascii en mayúscula al 				 de minúscula, es una diferencia de 20 (32 en hexadecimal);

.data 127 ; @ memoria para imprimir en tty;

tty_out: .rw 1;

.code 

	mov cero, tty_out ; 			borrar_pantalla();
	mov vector, letra; 				letra=vector[i];
WHILE: cmp letra, '.'; 				while(letra='.');
	beq PUNTO; 					salta a PUNTO si letra='.';
	cmp letra, ' '; 				if(letra=' ');
	beq PANTALLA; 	si es espacio, se queda como está y se 	escribe;
	add cminus, letra; 		  letra+=32, la letra se vuelve minúscula;
PANTALLA: mov letra, tty_out ; 		    cout << letra, imprimir(letra);
	add const, inst; 	    i=i++ (pasa a la sig componente del vector);
INST: mov vector, letra; 					       letra=vector[i]; 
	cmp cero, cero; 			     while(0=0),salto incondicional;
	beq WHILE; 							salto 	al while;
PUNTO: mov letra, tty_out;		escribe '.' por pantalla;
HALT: cmp cero, cero ; 		halt(); while(0=0),salto incondicional;
	beq HALT ;
.end

