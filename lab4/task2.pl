=pod 1.
Необходимо из слов файла организовать хеш. 
    Ключами хеша являются буквы русского алфавита, 
    а значениями строки, содержащие разделенные пробелами слова, начинающиеся на букву (обоих регистров), указанную в ключе хеша. 

Хеш вывести на экран в виде строк вида "ключ=>значение".
=cut

use utf8;
use open qw(:std :utf8);

open my $in, "<:utf8", "./files/words.txt" or die "Can't open file: $!";

my $text = do {local $/; <$in>};

close $in;

my @words = $text =~ /\w+/g;

my %hash;

push( @{$hash{uc(substr($_, 0, 1))}}, $_ ) foreach (@words);

foreach my $key (sort keys %hash) {
    my $words = $hash{$key};
    print "[$key] => \'", (join " ", @$words), "\'\n";
}

