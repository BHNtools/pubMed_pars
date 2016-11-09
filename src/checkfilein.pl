#!/usr/bin/perl
use strict;
use warnings;

use File::Basename;



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

my $inputFileTxt=$ARGV[0];


#**** STEP 3bis **** ________________________________________BEGIN___
my $tag_to_check='PMID-';
sub check_inPutFile_tags{
    my $check="";
    open FILE, $inputFileTxt;
    my @line = <FILE>;
    for (@line) {
        if ($_ =~ /$tag_to_check/) {
            print "$_\n";
            print("__ CHECK __ $tag_to_check : TAG... _OK \n");
            $check = "OK";
            return $check;

        }
    }
}

sub check_both_tag{
    my $both_check;
    print("STEP 3 : Checking if tags are in file ...\n");
    $tag_to_check = "TI  -";
    my $check_title = check_inPutFile_tags();
    $tag_to_check =  "AB  -";
    my $check_abstract = check_inPutFile_tags();

    if ($check_title eq "OK") {
        if ($check_abstract eq "OK") {
            print( "\nSTEP 3 : Checking if tags are in file ... _OK \n" );
            $both_check = "OK";
            return $both_check;

        } else {
            print( "check_abstract: TAG... _NOT FOUND  ... _ERROR\n" );
            $both_check = "ERROR";
            print( "\nSTEP 3 : Checking if tags are in file ... _ERROR \n" );
            return $both_check;
            exit;
        }

    } else {
        print( "check_title : TAG... _NOT FOUND  ... _ERROR\n" );
        $both_check = "ERROR";
        print( "\nSTEP 3 : Checking if tags are in file ... _ERROR \n" );
        return $both_check;
        exit;
    }
}
#**** STEP 3bis **** ________________________________________END___






#**** STEP 3 **** ________________________________________BEGIN___
sub check_inPutFile_extension{
    print("STEP 3 : Checking format file ....\n");
    my $exts = '.txt';
    my $file_exts = substr($inputFileTxt,-4);

    if ( $file_exts eq $exts){
        print("STEP 3 : Checking if format file is correct(.txt) ...._OK\n");
        print ("OK :: The file - $inputFileTxt - is a text file.\n");

        #CHECKING IF TAG EXISTS FOR TITLE AND ABSTRACT
        check_both_tag();

    } else {
        print("STEP 3 : Checking if format file is correct(.txt) ...._ERROR\n");
        print("PLEASE CHECK YOUR FORMAT FILE AND TRY AGAIN !!\n");
    }
}
#**** STEP 3 **** ________________________________________END___



#**** STEP 2 **** ________________________________________BEGIN___
sub check_inPutFile_existance{
    print("STEP 2 : Checking if file exist ....\n");
    if (-e $inputFileTxt) {
        print "OK :: The file - $inputFileTxt - exists.\n";
        print("STEP 2 : Checking if file exist ...._OK \n");
    } else {
        print "!!! ERROR :: The file - $inputFileTxt - does not exist!!\n
        Please check your input and try again.\n";
        print ("STEP 2 : Checking Arguments ...._ERROR \n");
        exit;
    }
}
#**** STEP 2 **** ________________________________________END___

1;