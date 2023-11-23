=pod 8.
В файле, в каждой строке записаны данные в формате:

Иванов 12 21 14 15 22
Петров 5 23 31
Сидоров 7 18 25 11

Требуется в отдельный файл записать данные

Иванов 84 зачтено
Петров 59 незачтено
Сидоров 61 зачтено

Здесь числа равны суммам чисел в соответствующих строках исходного файла.
=cut

use utf8;
use open qw(:std :utf8);

open my $in, '<:utf8', './files/students.txt' or die $!;
open my $out, '>:utf8', './files/students_result.txt' or die $!;

while (my $line = <$in>) {
    chomp $line;

    my ($name, @scores) = split " ", $line;

    my $total = 0; $total += $_ for @scores;

    print "$name $total ", $total >= 60 ? 'зачтено' : 'незачтено', "\n";
}

close $in;
close $out;

