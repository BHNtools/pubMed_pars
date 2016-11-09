#!/usr/bin/perl
use strict;
use warnings;


#CHECK FILE FORMAT
my $filepars = 'parsfilein.pl';
my $abs_path = abs_path($filepars);
my $under_path =  'src/'. $filepars ;

my $newpars = $abs_path =~ s/$filepars/$under_path/r;
require $newpars;


#**** STEP 5 ****________________________________________BEGIN___
sub output_Summary{
    # ___ TMP FILE __
    my $tmp_file = 'data/outPutData/tmp.txt';

    # ___ SUMMARY  FILE __
    my $summary_file = 'data/outPutData/Tag_Word_Count.txt';
    open(my $fS, '>', $summary_file);

    #title tag
    my $value_out_title = pars_fileIn_title();
    my $wordCount_out_title = test_count();
    #CLEAN DIR
    unlink $tmp_file;

    #abastact tag
    my $value_out_abstract = pars_fileIn_abstract();
    my $wordCount_out_abstract = test_count();
    #CLEAN DIR
    unlink $tmp_file;

    #pubMed tag
    my $value_out_pubMed = pars_fileIn_pubmedref();
    chop $value_out_pubMed;
    #CLEAN DIR
    unlink $tmp_file;

    #my $header  = "PUBMED_REF\tTITLE\tTI_WORD_COUNT\tABSTACT\tAB_\nWORD_COUNT\n";
    my $header  = "PUBMED_REF;TI_WORD_COUNT;AB_WORD_COUNT\n";
    printf $fS $header;
    my $linetoprint =$value_out_pubMed.";".$wordCount_out_title.";".$wordCount_out_abstract."\n";
    printf $fS $linetoprint;

    close($fS);
}
#**** STEP 5 ****________________________________________END___



#**** STEP 6 ****________________________________________BEGIN___
sub output_Details{
    # ___ TMP FILE __
    my $tmp_file = 'data/outPutData/tmp.txt';

    # ___ SUMMARY  FILE __
    my $summary_file = 'data/outPutData/Details_Tag_Word_Count.txt';
    open(my $fd, '>', $summary_file);

    #title tag
    my $value_out_title = pars_fileIn_title();
    my $wordCount_out_title = test_count();
    #CLEAN DIR
    unlink $tmp_file;

    #abastact tag
    my $value_out_abstract = pars_fileIn_abstract();
    my $wordCount_out_abstract = test_count();
    #CLEAN DIR
    unlink $tmp_file;

    #pubMed tag
    my $value_out_pubMed = pars_fileIn_pubmedref();
    chop $value_out_pubMed;
    #CLEAN DIR
    unlink $tmp_file;

    printf $fd "PUBMED_REF;".$value_out_pubMed."\n";
    printf $fd "TITLE;".$value_out_title."\n";
    printf $fd "TI_WORD_COUNT;".$wordCount_out_title."\n";
    printf $fd "ABSTRACT;".$value_out_abstract."\n";
    printf $fd "AB_WORD_COUNT;".$wordCount_out_abstract."\n";

    close($fd);
}

sub output_wordcloud{
    my %count;

    # ___ TMP FILE __
    my $value_out_abstract = pars_fileIn_abstract();
    my $tmp_file = 'data/outPutData/tmp.txt';
    open FILE, $tmp_file;

    # ___ SUMMARY  FILE __
    my $wordFreq_file = 'data/outPutData/Abstract_word_frequency.txt';
    open(my $fq, '>', $wordFreq_file);

    while (my $line = <FILE>) {
        chomp $line;
        foreach my $str (split /\s+/, $line) {
            $count{$str}++;
        }
    }

    foreach my $str (sort keys %count) {
        printf $fq "%-31s %s\n", $str, $count{$str};

    }
    close($fq);
    #CLEAN DIR
    unlink $tmp_file;
}
#**** STEP 6 ****________________________________________END___



