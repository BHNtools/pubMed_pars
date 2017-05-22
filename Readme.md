#PubMed-Pars 1.0.0 : Script for parsing PubMed citation file with Perl.


##Authors & Maintainer
###====================
BEN HASSINE Najla, NajlaBH.freelance@gmail.com.


##Usage
###=====
url : 


##Building
###========
git clone 

##Running
###========
<pre> #In terminal
$ unzip pubMed_pars.zip
$ cd pubMed_pars
$ ./pubMed_par.pl
</pre>


##OutPuts
- Three output files will be generated under the following path:
<pre>data/outPutData/</pre>

*Tag_Word_Count.txt

>> Extract : 
	
	-- PUBMED_REF:Pubmed reference.

	--TI_WORD_COUNT:Word count in title.
	
	--AB_WORD_COUNT:Word count in abstract.
	

*Details_Tag_Word_Count.txt
>> Extract :
	-- PUBMED_REF:Pubmed reference.
	
	-- TITLE:Title value.
	
	-- TI_WORD_COUNT:Word count in title.
	
	-- ABSTRACT:Abstract value.
	
	-- AB_WORD_COUNT:Word count in abstract.
	

*Abstract_word_frequency.txt
>> Extract :
	
	-- Count word frequency in the abstract.


##License
###========
MIT License.