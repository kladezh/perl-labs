=pod 4. 
Каждое слово предложения записать с новой строки.
=cut

my $sentence = "This is sample sentence for task 4";

my @words = split " ", $sentence;

my $text = join "\n", @words;

print $text;