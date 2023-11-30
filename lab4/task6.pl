=pod 6.
Задан список электронных адресов. 
Организовать хеш, 
    ключами которого будут наименования серверов, 
    а значениями - строки, содержащие перечисленные через запятую соответствующие электронные адреса.
=cut

my @emails = (
    'user1@gmail.com',
    'user__2@yahoo.com',
    'john.doe@hotmail.com',
    'info@gmail.com',
    'alice22@mail.ru',
    'support@rambler.net',
    'admin_01@mail.ru',
    'webmaster@rambler.net',
    'test.user@site.biz',
    'jane.smith@site.biz'
);

my %hash;

for my $email (@emails) {
    my ($user, $domain) = split "@", $email;
    push @{$hash{$domain}}, $user;
}

for my $domain (sort keys %hash) {
    print "$domain: " . join(", ", @{$hash{$domain}}) . "\n";
}
