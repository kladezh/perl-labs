=pod 9. 
Создать две программы: 
1. Первая передает второй строку чисел
2. Вторая их суммирует и результат выводит на экран
=cut Вторая программа

# принимаем строку чисел
my $string = shift @ARGV;

my $sum = 0; $sum += $_ for split " ", $string;

print "Результат: $sum";