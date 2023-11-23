=pod 4.
Для  заданного текстового файла построить хеш, 
    ключами которого будут числа, 
    а значениями - количество слов из файла, количество букв в которых равно ключу хеша.

(ключ - длина слова
значение - кол-во слов такой длины)
=cut

use utf8;
use open qw(:std :utf8);

open my $in, "<:utf8", "./files/text.txt" or die "Can't open file: $!";

my $text = do {local $/; <$in>};

close $in;

my @words = $text =~ /\w+/g;

my %hash;

$hash{length($_)}++ foreach (@words);

foreach my $key (sort { $a <=> $b } keys %hash) {
    print "[$key] => $hash{$key}\n";
}