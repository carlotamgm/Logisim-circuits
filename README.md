## Logisim circuits
A series of projects developed in Logisim that show how we can use circuits to understand the relation between hardware components and logic systems.
Each topic regards a special topic: logic gates, turing machine and turing machine with tty.

# 1. Logic gates using MOSFET transistors
MOSFET transistors behave like switches controlled by the value placed on their gate, signal w in the example on the left. The P-type transistor closes with gate=0 and opens with gate=1. The N-type transistor behaves the opposite way, closing with gate=1 and opening with gate=0.

Transistor, Constant, Power and Ground will be used to create the system regarding MOSFET models on the Logisim design sheet. 

# 2. Automatic synthesis of an integer display  
The circuit will have a 4-bit vector as input and must display the integer represented in two's complement. An integer adder will also be designed and several displays will be used to verify its correct operation.

A 4-bit carry propagation adder using AND, XOR, and OR gates, according to the design seen in class. A full adder will be replicated and everything will be connected  appropriately to calculate this: 4 mod 8 + (- (1 mod 8)).

# 3. Turing Machine with tty
 Basic project developed in Logisim that displays words on a TTY using a Turing Machine circuit.
