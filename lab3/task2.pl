=pod 2.
Вывести в файл таблицу умножения чисел от 1 до 9.
=cut

open my $out, '>', './files/multiplication_table.txt' or die $!;
for (my $i = 1; $i <= 9; $i++) {
	for (my $j = 1; $j <= 9; $j++) {
		print $out $i * $j, "\t";
	}
	print $out "\n";
}
close $out;