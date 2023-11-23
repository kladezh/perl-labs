=pod 3. 
Строка имеет вид "число+число:число+число". 
Вычислить соответствующее значение выражения.
=cut

my $expression = "2+2+4:2+0";

my @parts = split '\+', $expression;

my @dels = split ':', @parts[2];

@parts[2] = @dels[0] / @dels[1];

my $sum = 0;
foreach my $num (@parts) {
    $sum += $num;
}

print $sum;