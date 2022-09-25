nasm -f bin gdt_data.asm -o gdt_data.bin &&
xxd -b -c 4 gdt_data.bin > ./tmp && 
diff ./tmp ./expected_gdt_data
rm ./tmp