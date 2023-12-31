=pod 1.
Прочитать из файла слова и записать в другой файл только те из них, 
которые заканчиваются буквой 'в' в любом регистре.
=cut

use utf8;
use open qw(:std :utf8);

open my $in, '<:utf8', './files/words1.txt' or die $!;
open my $out, '>:utf8', './files/words_ending_with_v.txt' or die $!;

while (my $line = <$in>) {
	chomp $line;

	foreach my $word (split " ", $line) {
    	print $out "$word\n" if lc(substr($word, -1, 1)) eq 'в';
	}
}

close $in;
close $out;