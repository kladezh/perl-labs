=pod 1.
Данные о покупателе записаны в виде строки вида "name:Имя Отчество Фамилия, email:name@mail.su, age:27". 
Напишите программу, которая построит из этой строки соответствующий хеш.
=cut

open my $in, "<", "./files/customers.txt" or die "Can't open file: $!";

my @customers;

while (my $line = <$in>) {
	chomp $line;

	my %hash;

	foreach my $item (split ", ", $line) {
		my ($key, $value) = split ":", $item;
		$hash{$key} = $value;
	}

	push @customers, \%hash;
}

close $in;

my @keys = ('name', 'email', 'age');

foreach my $customer (@customers) {
	print "\n--------------------------------\n";
	foreach $key (@keys) {
		print "$key: $customer->{$key}\n";
	}
	print "--------------------------------\n";
}