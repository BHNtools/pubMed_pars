#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';




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


#**** STEP 4 ****________________________________________BEGIN___
#___ PRINT USAGE __ CHECK ARGS
my $inputFileTxt = $ARGV[0];
my $Usage = "Usage: ./pubMed_pars.pl fileToPars.txt \n\n\n" ;


sub pars_fileIn_pubmedref{
    #___ TEMP FILE ___
    my $textss ="";
    my $tmp_file = 'data/outPutData/tmp.txt';

    my $tag_to_check="PMID-";

    #__ OPEN THE TMP FILE __
    open(my $fh, '>', $tmp_file);

    #__ OPEN THE IN PUT FILE __
    open (FILE, $inputFileTxt);

    #___ PARSING LINE PER LINE___
    while (my $line = <FILE>) {

        #__ CHECK FOR TAG MATCH IN LINE __
        if ($line =~ m/$tag_to_check/) {
            $textss = substr($line,6,length($line));

            #__ PROCESS NEXT LINE UNTIL NEXT TAG __
            while(my $secondnextline  = <FILE>){
                last if(substr($secondnextline,0,1) !~ /^\s/);
                $textss = $textss . " " .  $secondnextline;
            }
        }
    }
    close (FILE);
    print $fh $textss;
    #print($textss);
    close($fh);
    print ("STEP 4 : PARSING _ PUBMED_REF ...._OK \n");
    return $textss;
}

sub pars_fileIn_title{
    #___ TEMP FILE ___
    my $textss ="";
    my $tmp_file = 'data/outPutData/tmp.txt';

    my $tag_to_check="TI  -";

    #__ OPEN THE TMP FILE __
    open(my $fh, '>', $tmp_file);

    #__ OPEN THE IN PUT FILE __
    open (FILE, $inputFileTxt);

    #___ PARSING LINE PER LINE___
    while (my $line = <FILE>) {

        #__ CHECK FOR TAG MATCH IN LINE __
        if ($line =~ m/$tag_to_check/) {
            $textss = substr($line,5,length($line));

            #__ PROCESS NEXT LINE UNTIL NEXT TAG __
            while(my $secondnextline  = <FILE>){
                last if(substr($secondnextline,0,1) !~ /^\s/);
                $textss = $textss . " " .  $secondnextline;
            }
        }
    }
    close (FILE);
    print $fh $textss;
    #print($textss);
    close($fh);
    print ("STEP 4 : PARSING _ TITLE ...._OK \n");
    return $textss;
}

sub pars_fileIn_abstract{
    #___ TEMP FILE ___
    my $textss ="";
    my $tmp_file = 'data/outPutData/tmp.txt';

    my $tag_to_check="AB  -";

    #__ OPEN THE TMP FILE __
    open(my $fh, '>', $tmp_file);

    #__ OPEN THE IN PUT FILE __
    open (FILE, $inputFileTxt);

    #___ PARSING LINE PER LINE___
    while (my $line = <FILE>) {

        #__ CHECK FOR TAG MATCH IN LINE __
        if ($line =~ m/$tag_to_check/) {
            $textss = substr($line,5,length($line));

            #__ PROCESS NEXT LINE UNTIL NEXT TAG __
            while(my $secondnextline  = <FILE>){
                last if(substr($secondnextline,0,1) !~ /^\s/);
                $textss = $textss . " " .  $secondnextline;
            }
        }
    }
    close (FILE);
    print $fh $textss;
    #print($textss);
    close($fh);
    print ("STEP 4 : PARSING _ ABSTRACT ...._OK \n");
    return $textss;
}

sub test_count {
    my $linez   = 0;
    my $words   = 0;
    my $nwords  =  0;
    my $total = 0;

    my $tmp_file = 'data/outPutData/tmp.txt';
    open FILE, $tmp_file;

    while (my $linei = <FILE>) {
        $linez=$linez+1;
        my @words = split( " ", $linei );
        $nwords = @words;
        #print "Number of words on the line $linez are : $nwords \n";
        $total = $total+$nwords;
    }
    #print "\nTotal no. of words in file are $total \n";
    print ("STEP 4 : COUNTING WORD  ...._OK \n");
    return $total
}

#**** STEP 4 ****________________________________________END___




#___CALL PARSING INPUT

1;