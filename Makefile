all:
	gcc -Wall -Werror contained.c -o contained -lcap -lseccomp

original:
	gcc -Wall -Werror cntd.c -o contained -lcap -lseccomp

clean:
	rm -rf contained
