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

my $file = 'checkfilein.pl';
my $abs_path = abs_path($file);
my $under_path =  'src/'. $file ;

my $new = $abs_path =~ s/$file/$under_path/r;
#print($new);
require $new;



#**** STEP 1 ****________________________________________BEGIN___
#___ PRINT USAGE __ CHECK ARGS
my $inputFileTxt = $ARGV[0];
my $Usage = "Usage: ./pubMed_pars.pl fileToPars.txt \n\n\n" ;


sub check_arguments() {
    print ("STEP 1 : Checking Arguments .... \n");
    #PRINT OK ::  ARGUMENT IS ASSIGNED
    if (defined $inputFileTxt) {
        print "OK :: Get an input file - '$inputFileTxt' - we have to check it now !! \n";
        print ("STEP 1 : Checking Arguments ...._OK \n");

        #2_-__CHECK IF FILE EXIT ___
        check_inPutFile_existance($inputFileTxt);

        #3_-_CHECK IF FILE FORMAT IS CORRECT ___
        check_inPutFile_extension();

        exit;
    }

    #PRINT ERROR WHEN INPUT FILE IS MISSING
    if (not defined $inputFileTxt) {
        print ("STEP 1 : Checking Arguments ...._ERROR \n");
        die "\n !!! ERROR !!! :: Need inputFileText\n
        Please put a file as an argument and try again.\n
        $Usage \n";

    }
}
#**** STEP 1 ****________________________________________END___

1;


