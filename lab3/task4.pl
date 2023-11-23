=pod 4.
В файле записаны числа, отделенные друг от друга символом табуляции по строкам, 
отделенными символом '\n'. Запишите построчные суммы чисел в отдельный файл.
=cut

open my $in, '<', './files/numbers.txt' or die $!;
open my $out, '>', './files/sums.txt' or die $!;

while (my $line = <$in>) {
	chomp $line;

	my @numbers = split "\t", $line;
	my $sum = 0; $sum += $_ for @numbers;

	print $out $sum, "\n";
}

close $in;
close $out;