#!/usr/bin/perl
package ParsPub;

use strict;
use warnings;
use Test::More;

print("\n -- BHNtools|| PubMed-Perl-Pars:: TestSuite --\n");

#TEST PRINT
sub test_hello {
    #Print hello
    print "\n TEST : Print Hello \n
    Hello World from NajlaBioinfo Ubuntu Docker image.\n" ;
}
pass;

#DIAG//NOTES
print("\n__DIAG__\n");
note("TEST1 : ");
diag(test_hello());



#DEFINE NBR OF TESTS
my $number_of_tests_run=1;
#done_testing;
done_testing( $number_of_tests_run );