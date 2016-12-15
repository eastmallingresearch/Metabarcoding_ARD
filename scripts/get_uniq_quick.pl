#! /usr/bin/perl -w -s

my %seq=();

my $fasta="";
my $lastcount=0;
while (<>) {
	if ($_=~/\>/) {
		if ($fasta ne "") {
			if (exists $seq{$fasta}) {
				$seq{$fasta}.=$_;
			} else {
				$seq{$fasta}=$_;
			}
		}
		#$lastcount=$count;
		$fasta="";		
	} else{
		chomp;
		$fasta.=$_;
	}
}

if ($fasta ne "") {
	if (exists $seq{$fasta}) {
		$seq{$fasta}++;
	} else {
		$seq{$fasta}=1;
	}
}


my $counter=1;
foreach my $key ( keys %seq) {
	#if($seq{$key}>1) {
		print">uniq.$counter;size=$seq{$key};\n$key\n";
		$counter++;
	#}
}