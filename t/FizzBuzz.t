use Test::More tests => 2;

use lib 'lib';


BEGIN{
    use_ok('FizzBuzz');
}

my $rand_test = FizzBuzz::getRandom();
ok($rand_test > 0 && $rand_test < 1000, "random appears to work");

