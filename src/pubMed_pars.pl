#!/usr/bin/perl
use strict;
use warnings;


#------------------------------
#BY NajlaBioinfo 2016
#PubMed citation file parsing
#-------------------------------
#__PROCESSING STEP__
#1_Checking arguments
#2_Checking input file existance
#3_Checking input file format
#4_Parsing
#5_Define output file structure
#6_OutPut examples

#Import intern module
use Cwd;
my $dir = getcwd;
use Cwd 'abs_path';

my $file = 'checkargs.pl';
my $abs_path = abs_path($file);
my $under_path =  'src/'. $file ;

my $new = $abs_path =~ s/$file/$under_path/r;
#print($new);
require $new;


#-----
# -------------------------
#BY NajlaBioinfo 2016
#PubMed citation file parsing
#-------------------------------
#__PROCESSING STEP__
#1_Checking arguments
#2_Checking input file existance
#3_Checking input file format
#4_Checking outPut dir access
#5_Parsing
#6_Summary
#7_Example of outPut



#**** STEP 1 ****________________________________________BEGIN___
#___ PRINT USAGE __ CHECK ARGS
my $inputFileTxt = $ARGV[0];
my $About = "
 ------------------------------------------------------------\n
 -- BHNtools|| PubMed-Perl-Pars:: Version(1.0.0) --\n
 *** By NajlaBioinfo(NajlaBH.freelance\@gmail.com) ***
 ------------------------------------------------------------\n\n
 Usage: ./pubMed_pars.pl fileToPars.txt \n\n
 For further informations please take a look to the Readme.md file.\n\n" ;


#**** MAIN ****________________________________________BENGIN___
sub pubMed_pars_call() {
    #__ ABOUT THE SOFTWARE __
    print ($About);
    #__ CHECK ARGUMENTS __
    check_arguments();
}
#**** MAIN ****________________________________________END___


#SCRIPT CALL
pubMed_pars_call();


