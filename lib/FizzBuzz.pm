package FizzBuzz;

use strict;
use warnings;

sub getRandom
{
    return int(rand(1000));
}

sub fizzBuzz
{
    my ($to_test) = @_;

    return    $to_test % 15 == 0 ? "FizzBuzz"
            : $to_test %  3 == 0 ? "Fizz"
            : $to_test %  5 == 0 ? "Buzz"
            : $to_test;
}

sub doFizzBuzz
{
       print  "\n" . fizzBuzz(getRandom()) . "\n";
} 


1;