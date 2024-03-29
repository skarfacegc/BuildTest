valgrind_test: valgrind_test.c
	gcc -o valgrind_test valgrind_test.c

clean:
	rm -rf valgrind_test cover_db test_results.xml *.valgrind_result

auto_test:
	cover --delete
	PERL5OPT=-MDevel::Cover=-coverage,statement,branch,subroutine,time,+ignore,".*prove.*","\.t" prove -r --timer --formatter=TAP::Formatter::JUnit > test_results.xml
	cover -report clover
	cover -report html
