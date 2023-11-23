=pod 7.
Переписать слова из файла в другой файл, нумеруя их.
=cut

open my $in, '<', './files/words.txt' or die $!;
open my $out, '>', './files/words_numbered.txt' or die $!;

my $i = 1;

while (my $line = <$in>) {
	chomp $line;

	foreach my $word (split " ", $line) {
		print $out $i++, ". ", $word, "\n";
	}
}

close $in;
close $out;