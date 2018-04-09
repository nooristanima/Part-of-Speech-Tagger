#!C:\Strawberry\perl -w

use strict;
use warnings;
use Data::Dumper;
my @lineArray;
my @lineArray2;
my @textArray0;
my @POSArray0;
my $filename = $ARGV[0];

open(my $fh, "<", $filename) or die $!;
		while(my $line = <$fh>){
			chomp $line;
			@lineArray = split/!\w+\//, $line;
			push(@textArray0, @lineArray);
			@lineArray2 = split/!\/\w+/, $line;
			push(@POSArray0, @lineArray2);
			}
			my $temp;
			my @tempArray;
			my @textArray;

			for(my $x=0;$x<@textArray0;$x++){
					@tempArray = ($textArray0[$x] =~ /\w+\/\w+/g);
					push(@textArray, @tempArray);
					}	

					close $fh;

					my @POSArray;
					my @wordArray;
					my @tempArray2;
					@tempArray = ();
					for(my $x=0;$x<@textArray;$x++){
							@tempArray = split/\/\w+/, $textArray[$x];
							push(@wordArray, @tempArray);
							@tempArray2 = ($textArray[$x] =~ /\w+$/g);
							push(@POSArray, @tempArray2);
							}
							my %hash;
							my @pushArray = ();
							for(my $x=0;$x<@textArray;$x++){
									$hash{$POSArray[$x]}{$wordArray[$x]}+=1;
									}
									my @testArray;
									@lineArray = ();
									$filename = $ARGV[1];
									open(my $fh2, "<", $filename) or die $!;
											while(my $line = <$fh2>){
												chomp $line;
												@lineArray = ($line =~ /\w+|[_.,!?"':;\+\-\*]/g);
												push(@testArray, @lineArray);
												}
												close $fh2;

												#print Dumper @testArray;

												my @keyList = keys %hash;
												my $keyListSize = @keyList;
												my $wordCount=0;
												my $pos;
												my $key;
												my $test;
												my $posKey;
												for(my $x=0;$x<@testArray;$x++){
														for(my $y=0;$y<@keyList;$y++){
																if(exists $hash{$keyList[$y]}{$testArray[$x]}){
																if($wordCount<$hash{$keyList[$y]}{$testArray[$x]}){
																		$wordCount=$hash{$keyList[$y]}{$testArray[$x]};
																		print "$testArray[$x]/$keyList[$y] ";
																		}}
																		#add NN tag for words that were not trained that show up in test
																		}
																		if($testArray[$x] =~ /\.|\,|\:|\;|\'|\"|\!|\?|\-|\+|\*/){
																		print "$testArray[$x]/$testArray[$x] ";
																		}
																		$wordCount=0;}
																		#print "--------------\n";																									