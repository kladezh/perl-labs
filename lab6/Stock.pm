=pod Класс "Склад"
Описать класс Склад, содержащий закрытый массив товаров. Обеспечить следующие возможности:
- вывод информации о товаре по номеру с помощью индекса;
- вывод на экран информации о товаре, название которого введено с клавиатуры; 
    - если таких товаров нет, выдать соответствующее сообщение;
=cut

package Stock;

use utf8;

use lib '.';
use Product;

# конструктор
sub new($) {
    my ($class, $products) = @_;
    my $self = {
        products => $products // [],
    };
    bless $self, $class;
    return $self;
}

# добавления элементов из строк (донные должны быть в формате 'name,\sstore,\scost\n')
sub from_string($) {
    my ($self, $string) = @_;

    my @products;

    my @rows = split /\n/, $string;

    for my $row (@rows) {
        my ($name, $store, $cost) = split /\s+/, $row;

        push @products, Product->new($name, $store, $cost);
    }

    $self->{products} = \@products;
}

# добавление объекта
sub add($) {
    my ($self, $product) = @_;
    push @{$self->{products}}, $product;
}

# удаление объекта по индексу
sub remove($) {
    my ($self, $index) = @_;
    splice @{$self->{products}}, $index, 1;
}

# получение инфы о всех объектах
sub info {
    my $self = shift;

    my $output = "i\tname\tstore\tcost\t\n";
    for my $i (0..$#{$self->{products}}){
        my $product = @{$self->{products}}[$i];
        $output .= "$i\t" . $product->name . "\t" . $product->store. "\t" . $product->cost . "\t\n";
    }
    
    return $output;
}

# получение инфы об объекте по индексу
sub info_by_index($) {
    my ($self, $index) = @_;
    
    if(not defined @{$self->{products}}[$index]){
        return "Не найден элемент с индексом [$index]";
    }

    my $product = @{$self->{products}}[$index];
    return "Name: {$product->name()}, Store: {$product->store}, Cost: {$product->cost}";
}

# получение инфы об объекте по его названию
sub info_by_name($) {
    my ($self, $name) = @_;

    my $output = "";
    for my $i (0..$#{$self->{products}}) {
        $output .= $self->info_by_index($i) if @{$self->{products}}[$i]->name =~ /$name/;
    }

    return $output // "На найдены элементы с названием \"$name\"";
}


1;