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
	@lineArray = ($line =~ /\w+\//g);
	push(@textArray0, @lineArray);
	@lineArray2 = ($line =~ /\/\w+/g);
	push(@POSArray0, @lineArray2);
	#@lineArray = split(/\w+\/NNP/, $line);

}

my $temp;
my @POSArray;
my @tempArray;
my @textArray;
my @tempArray2;

for(my $x=0;$x<@textArray0;$x++){
	@tempArray = ($POSArray0[$x] =~ /\w+/g);
	push(@POSArray, @tempArray);
	@tempArray = ($textArray0[$x] =~ /\w+/g);
	push(@textArray, @tempArray);
	#might have to improve hash key list to exclude some shit
}

close $fh;

# for(my $x=0;$x<@textArray;$x++){
	# print "$x: $textArray[$x]\n";
	# print "$x: $POSArray[$x]\n";
# }

my %hash;
my @pushArray = ();
# for(my $x=0;$x<@textArray;$x++){
	# if(exists $hash{$textArray[$x]}){
		# $hash{$textArray[$x]} .= $POSArray[$x];
	# }
	# else{
		# $hash{$textArray[$x]} .= $POSArray[$x];
	# }
# }

for(my $x=0;$x<@textArray;$x++){

	if(exists $hash{$POSArray[$x]}){
		push (@{$hash{$POSArray[$x]}}, $textArray[$x]);
	}
	else{
		push (@{$hash{$POSArray[$x]}}, @pushArray);
		push (@{$hash{$POSArray[$x]}}, $textArray[$x]);;
	}
}

delete $hash{'10th'};
delete $hash{'2'};
delete $hash{'4'};
delete $hash{'8'};
delete $hash{'16'};
delete $hash{'investors'};
delete $hash{'McGraw'};
delete $hash{'Contra'};
delete $hash{'Firestone'};
delete $hash{'winter'};

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
print scalar @testArray;
my @keyList = keys %hash;
my $counter=0;
for(my $y=0; $y<@testArray; $y++){
	my $test = $testArray[$y];
	#print "$counter: $test\n";
	#$counter++;
LABEL:	for(my $z=0; $z<@keyList;$z++){
		my $size = scalar @{$hash{$keyList[$z]}};
		for(my $x=0;$x<$size;$x++){
			if($test eq $hash{$keyList[$z]}[$x]){
				print "$test/$keyList[$z]\n";
				last LABEL;
				#NEED ELSE STATEMENT TO HANDLE ANYTHING NOT IN TRAINING DATASET
			}
		}
	}	
}

# foreach my $key(keys %hash){
	# print "$key\n";
# }

# my $size = scalar @{$hash{'CD'}};
# print $size;

#print "$testArray[0] $testArray[1] $testArray[2] $testArray[3] $testArray[4] $testArray[5] $testArray[6] $testArray[7] $testArray[8]";
# print "$_, " for keys %hash;

# print scalar @{$hash{'SYM'}};

# for(my $x=0;$x<1;$x++){
	# print "\n$hash{'SYM'}[$x]";
# }

# my $size = keys %hash;
# print "\n$size";

#print Dumper \@testArray;
#print Dumper \%hash;
#print Dumper \@POSArray;














