use strict;
use feature 'state';
use warnings;
use warnings qw(FATAL utf8);
use utf8;
use feature qw(unicode_strings);
use open qw(:std :utf8);

unless ( @ARGV == 2 ) { 
    print "Usage: script.pl input_file output_file\n";
        exit;
}

my %fwhw = (
	'０' => '0', '１' => '1', '２' => '2', '３' => '3', '４' => '4',
	'５' => '5', '６' => '6', '７' => '7', '８' => '8', '９' => '9',
	'Ａ' => 'A', 'Ｂ' => 'B', 'Ｃ' => 'C', 'Ｄ' => 'D', 'Ｅ' => 'E',
	'Ｆ' => 'F', 'Ｇ' => 'G', 'Ｈ' => 'H', 'Ｉ' => 'I', 'Ｊ' => 'J',
	'Ｋ' => 'K', 'Ｌ' => 'L', 'Ｍ' => 'M', 'Ｎ' => 'N', 'Ｏ' => 'O',
	'Ｐ' => 'P', 'Ｑ' => 'Q', 'Ｒ' => 'R', 'Ｓ' => 'S', 'Ｔ' => 'T',
	'Ｕ' => 'U', 'Ｖ' => 'V', 'Ｗ' => 'W', 'Ｘ' => 'X', 'Ｙ' => 'Y',
	'Ｚ' => 'Z', 'ａ' => 'a', 'ｂ' => 'b', 'ｃ' => 'c', 'ｄ' => 'd',
	'ｅ' => 'e', 'ｆ' => 'f', 'ｇ' => 'g', 'ｈ' => 'h', 'ｉ' => 'i',
	'ｊ' => 'j', 'ｋ' => 'k', 'ｌ' => 'l', 'ｍ' => 'm', 'ｎ' => 'n',
	'ｏ' => 'o', 'ｐ' => 'p', 'ｑ' => 'q', 'ｒ' => 'r', 'ｓ' => 's',
	'ｔ' => 't', 'ｕ' => 'u', 'ｖ' => 'v', 'ｗ' => 'w', 'ｘ' => 'x',
	'ｙ' => 'y', 'ｚ' => 'z', '－' => '-', '、' => ', ', '　' => ' ',
	'／' => '/',);

sub slurp {
	my $file = shift;
	open my $fh_read, '<', $file or die "Could not open file: $!";
	return do {local $/; <$fh_read>};
}

#sub convert {
#	my $sub_string = shift;
#	$sub_string =~ s/(.)/$fwhw{$1}?$fwhw{$1}:$1/seg;
#	return $sub_string;
#}

sub convert {
	state $s = join '', keys(%fwhw);
	state $r = join '', values(%fwhw);
	state $tr = eval("sub { $_[0] =~ tr/\Q$s\E/\Q$r\E/r }");
	return $tr->($_[0]);
}

my $string = slurp($ARGV[0]);

$string =~ s/<target>\s*<g id="\d+">\K(.*?)(?=<\/g>\s*<\/target>)/convert($1)/seg;

open my $fh_write, ">", $ARGV[1] or die "Could not open file: $!";
													 
print $fh_write $string;

close $fh_write;
