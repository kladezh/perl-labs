=pod 5.
Задан список имен файлов. 
Организовать хеш, 
    ключами которого будут расширения файлов, 
    а значениями количество соответствующих файлов.
=cut

my @files = ('task1.pl', 'task2.pl', 'task3.pl', 'task4.pl', 'task5.pl', 'task6.pl', 'customers.txt', 'text.txt', 'words.txt');

my %hash;

for my $file (@files) {
    my ($name, $ext) = split /\./, $file;
    $hash{$ext}++;
}

for my $key (keys %hash) {
    print "[$key] => $hash{$key}\n";
}