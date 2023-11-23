=pod 6.
Дан файл. Определите сколько в нем букв, слов, строк. 
Выведите три найденных числа в формате, приведенном в примере.

Input file contains: 108 letters 20 words 4 lines
=cut

# Можно получить имя файла в командой строке (без расширения .txt),
# если не передано, то открывается файл text.txt
$filename = defined @ARGV[0] ? @ARGV[0] : 'text';

open my $in, '<', "./files/$filename.txt" or die $!;

my $letters = 0;
my $words = 0;
my $lines = 0;

while (my $line = <$in>) {
	chomp $line;

	$letters += length($line);
	$words += split " ", $line;
	$lines++;
}

print "Файл '$filename.txt' содержит: $letters буков, $words словов, $lines строков и 0 рыбов.";

close $in;