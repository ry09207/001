#!/usr/bin/perl -w

# https://codeiq.jp/q/1678
#
# 標準入力から2つの10進数を与え、
# 2つの数字に挟まれる数の2進数が左右反転しても同一であるものの数をカウントする
#

use strict;
use warnings;
#use Time::HiRes;

while(defined(my $line=<STDIN>)){
	my ($num,$end) = split(/\,/,$line);
	my $counter = 0;
	$num += 1;
	while ($num < $end) {
		my $bin  = dec2bin($num);
		my $reverse = reverse($bin);
		if ( $bin == $reverse ) {
			 $counter++;
		}
		$num += 1;
	}
	print "$counter \n";
	
	#my $start_time = Time::HiRes::time;
	#printf("%0.3f",Time::HiRes::time - $start_time); 
	#print "\n";
}

# 10進数から2進数
sub dec2bin{
	my ($val) = @_;
	my $ret = '';
	my $i;

	return 0 if ($val == 0);
	while ($val > 0){
		$i = $val % 2;
		$ret = "$i$ret";
		$val = int($val / 2);
	}
	return $ret;
}
