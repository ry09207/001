#!/usr/bin/perl -w

# https://codeiq.jp/q/1630
#
#  1からnまで連続する正の整数の中に「7」がいくつあるかを数える。
#

#use Time::HiRes;

my $target = 7;

while(defined(my $line=<STDIN>)){
	#my $start_time = Time::HiRes::time;

	my $count = 0;		#$targetに一致する文字数をカウント
	for (my $i = 1; $i <= $line; $i++) {
		if ($i =~ s/$target/$target/g){
			$count += ($i =~ s/$target/$target/g);
		}
	}
	print $count . "\n";

	#printf("%0.3f",Time::HiRes::time - $start_time); 
	#print "\n";
}
