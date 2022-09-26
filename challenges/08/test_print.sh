nasm -f bin print.asm -o print.bin &&
xxd -b -c 4 print.bin > ./tmp && 
diff ./tmp ./print
rm ./tmp
