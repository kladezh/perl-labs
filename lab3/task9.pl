=pod 9.
Создать две программы: 
1. Первая передает второй строку чисел
2. Вторая их суммирует и результат выводит на экран
=cut

sub number_string {
    return "10 4 5 20";
}

sub sum($) {
    my ($string) = @_;

    $sum = 0; $sum += $_ for split " ", $string;
    return $sum;
}


print sum number_string;