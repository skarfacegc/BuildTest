use Test::More tests => 6;
use Test::Output;
use Sub::Override;

use lib 'lib';

BEGIN
{
    use_ok('FizzBuzz');
}

my $rand_test = FizzBuzz::getRandom();
ok( $rand_test > 0 && $rand_test < 1000, "getRandom" );

#
# Now we override getRandom to give us some craft values to test
# all of the conditions in FizzBuzz::FizzBuzz
#
my $override = Sub::Override->new;

# Test for 3
$override->replace( 'FizzBuzz::getRandom', sub { 3 } );
stdout_like( sub { FizzBuzz::doFizzBuzz() }, qr/Fizz/, "doFizzBuzz == Fizz" );

# Test for 5
$override->replace( 'FizzBuzz::getRandom', sub { 5 } );
stdout_like( sub { FizzBuzz::doFizzBuzz() }, qr/Buzz/, "doFizzBuzz == Buzz" );

# Test for 15
$override->replace( 'FizzBuzz::getRandom', sub { 15 } );
stdout_like( sub { FizzBuzz::doFizzBuzz() }, qr/FizzBuzz/, "doFizzBuzz == FizzBuzz" );

# Test for other
$override->replace( 'FizzBuzz::getRandom', sub { 7 } );
stdout_like( sub { FizzBuzz::doFizzBuzz() }, qr/7/, "doFizzBuzz == 7" );