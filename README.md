John Albert D. Rebancos
DCpET 3-2

Assembly Program to Sum Four Numbers

Overview

This program is written in x86 Assembly language and uses DOS interrupts to interact with the user. The program:

Prompts the user to input four numbers.

Calculates the sum of the entered numbers.

Displays the result on the screen.

Features

Accepts single-digit numeric inputs.

Displays prompts and results using DOS interrupt 21h.

Handles multi-digit number display through stack operations.

Files

test.asm: The source code for the program.

test.obj: The object file generated after assembly.

test.exe: The executable file created after linking.

How It Works

Data Segment:

Contains prompts for user inputs and a message for the result.

Stores variables for the input numbers and their sum.

Code Segment:

The MAIN procedure initializes the data segment, prompts the user, calculates the sum, and displays the result.

The GetNumber procedure reads a single digit from the user and converts it from ASCII to a numeric value.

The PrintNumber procedure handles multi-digit number output using division and the stack.

Prerequisites

A DOS-based environment or an emulator like DOSBox.

MASM (Microsoft Macro Assembler) for assembling the code.

TLINK (Turbo Linker) for linking the object file.

How to Compile and Run

Step 1: Assemble the Code

Use MASM to assemble the test.asm file:

MASM test.asm;

Step 2: Link the Object File

Link the assembled object file to create the executable:

TLINK test.obj;

Step 3: Run the Program

Execute the program:

test

Input and Output

Example

Input:

     Enter the first number: 5
     Enter the second number: 7
     Enter the third number: 3
     Enter the fourth number: 8

Output:

     The sum of the numbers is: 23

Code Structure

Procedures

MAIN:

Initializes the data segment.

Displays prompts and calls GetNumber to retrieve inputs.

Computes the sum of the four numbers.

Displays the result using PrintNumber.

GetNumber:

Reads a single character input.

Converts it from ASCII to a numeric value.

PrintNumber:

Converts a numeric value into its ASCII representation.

Displays the number by iteratively extracting digits and printing them.

Notes

Ensure that the input values are valid single-digit numbers.

To handle multi-digit input, additional logic can be implemented in GetNumber.

Troubleshooting

Error: "Operand types do not match":

Ensure operand sizes are consistent, especially in arithmetic operations.

The ADD instruction must operate on registers or memory locations of the same size.

Program doesn't run on modern systems:

Use an emulator like DOSBox to run the program in modern environments.
