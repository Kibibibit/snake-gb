#!/bin/bash

# Compiles and links the files

rgbasm -LH -o main.o main.asm
rgblink -o snake.gb main.o
rgbfix -vC -p 0xFF snake.gb