use strict;
use 5.010;
use utf8;

my $fname = 'acdcess.log';
my %hash = ();

open(my $fh, '<', $fname) or die "Everising is bad '$fname' $!";
while (my $line = <$fh>)
{
	if ($line =~ /(\d+\.\d+.\d+.\d+)/)
	{
		if(exists($hash{ $1 }))
		{
			$hash{ $1 }++;
		}
		else
		{
			$hash{ $1 } = 1;
		}
	}
}

my $i = 0;
foreach(sort {$hash{$b} <=> $hash{$a}} keys %hash)
{
	print $_,' = ',$hash{$_},"\n";
	$i++;
	if ($i >= 10)
	{
		last;
	}
}

