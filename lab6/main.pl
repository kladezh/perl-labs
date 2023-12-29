=pod 6.
В рамках класса реализовать конструктор с параметрами и без параметров. 
Описать метод для получения состояния объекта. 
Исходные данные для массива объектов считываются из файла.
Описывать нужные классы в модульных файлах .pm. 
Предусмотреть возможность добавления и удаления данных из массива объектов.

Вариант 2. Классы "Товар" и "Склад"
=cut

use utf8;
use open qw(:std :utf8);

use feature 'switch';

use lib '.';
use Stock;


my $stock = new Stock;

$stock->from_string(from_file("products.txt"));

print $stock->info();

$stock->add(new Product("Морковь", "fsf", 1000));

print "\n" . $stock->info();

$stock->remove(1);

print "\n" . $stock->info();



sub from_file($) {
    my $filename = shift;

    open my $in, "<:utf8", "./$filename" or die $!;

    my $text = do {local $/; <$in>};

    close $in;

    return $text;
}
