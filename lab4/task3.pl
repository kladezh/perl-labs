=pod 3.
Для заданного текста построить хеш, 
    ключами котрого будут буквы русского или латинского алфавита, 
    а значением - частота соответствующего символа в тексте. 

Отсортировать хэш по ключам.
=cut

use utf8;
use open qw(:std :utf8);

open my $in, "<:utf8", "./files/text.txt" or die "Can't open file: $!";

my $text = do {local $/; <$in>};

close $in;

my @words = $text =~ /\w+/g;

my %hash;

foreach my $word (@words) {
    $hash{uc($_)}++ foreach split '', $word;
}

foreach my $key (sort keys %hash) {
    print "[$key] => $hash{$key}\n";
}