#!/usr/bin/perl -w

# https://codeiq.jp/q/1719
#
# 標準入力で与えられた文字をそのまま標準出力に表示する。
#

use strict;
use warnings;

while(defined(my $line=<STDIN>)){
	print "$line";
}
