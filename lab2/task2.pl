=pod 2. 
Записано арифметическое выражение вида:
    12+22+31+44+87+7

Сформируйте массив слагаемых. Вычислите сумму и вывести ее на экран.
=cut

my $expression = "12+22+31+44+87+7";
my @summands = split '\+', $expression;

my $sum = 0;
foreach my $summand (@summands) {
    $sum += $summand;
}

print $sum;