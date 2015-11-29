#!/usr/bin/perl -w

# https://codeiq.jp/q/2082
# 
# 標準入力から与えられる年月(YYYYMM)を元に、その月のカレンダーを出力する
# 日曜始まりのカレンダーを出力した後に、続けて月曜始まりのカレンダーを出力する。
#

use Time::HiRes;
use Time::Local;

while(defined(my $line=<STDIN>)){
	my $start_time = Time::HiRes::time;

	my $year = substr($line, 0, 4);
	my $mon = substr($line, 5, 1);
	my $lastday = &GetLastDay($year, $mon);

	print $lastday . "\n";

	print GetWeekDay($year,$mon,$lastday) . "\n";
}

sub GetLastDay {
    my($year, $mon) = @_;
    if(!$year || !$mon) {return;}
    if($year < 1900 || $year > 2023) {return;}
    if($mon < 1 || $mon > 12) {return;}
    if($mon == 12) {$mon = 0;}
    my $time = timelocal(0, 0, 0, 1, $mon, $year-1900);
    $time -= 60*60*24;
    my @date = localtime($time);
    return $date[3];
}

 sub GetWeekDay {
	my($year,$mon,$day) = @_;

	if ($mon == 1 or $mon == 2) {
		$year--;
		$mon += 12;
	}
	return ($year + int($year / 4) - int($year/100) + int($year / 400) + int((13 * $mon + 8) / 5) + $day) % 7;
 }
