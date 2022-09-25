nasm -f bin gdt_code.asm -o gdt_code.bin &&
xxd -b -c 4 gdt_code.bin > ./tmp && 
diff ./tmp ./expected_gdt_code
rm ./tmp