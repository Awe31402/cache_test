all:
	gcc -g main.c -o main
trans:
	gcc main.c -o main -DTRANS
clean:
	rm main
