valgrind_test: valgrind_test.c
	gcc -o valgrind_test valgrind_test.c

clean:
	rm -f valgrind_test
