nasm -f bin gdt_null.asm -o gdt_null.bin &&
xxd -b -c 4 gdt_null.bin > ./tmp && 
diff ./tmp ./expected_gdt_null
rm ./tmp