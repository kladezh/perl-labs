=pod Класс "Товар"
Описать класс Товар, содержащий следующие закрытые поля:
- название товара;
- название магазина, в котором продается товар;
- тоимость товара в рублях.

Предусмотреть свойства для получения состояния объекта.
Реализовать перегруженную операцию сложения товаров, выполняющую сложение их цен.
=cut

package Product;

use utf8;

use overload '+' => \&add;

# конструкор
sub new($$$) {
    my ($class, $name, $store, $cost) = @_;
    my $self = {
        name  => $name  // '',
        store => $store // '',
        cost  => $cost  // 0,
    };
    bless $self, $class;
    return $self;
}

# получение свойств

sub name {
    my $self = shift;
    return $self->{name};
}

sub store {
    my $self = shift;
    return $self->{store};
}

sub cost {
    my $self = shift;
    return $self->{cost};
}

# изменение свойств

sub set_name {
    my ($self, $value) = @_;
    $self->{name} = $value;
}

sub set_store {
    my ($self, $value) = @_;
    $self->{store} = $value;
}

sub set_cost {
    my ($self, $value) = @_;
    $self->{cost} = $value;
}

# перегруженная операция сложения
sub add($) {
    my ($self, $other) = @_;

    # Проверяем, является ли $other объектом того же класса
    if (ref $other eq ref $self) {
        return $self->{cost} + $other->{cost};
    }

    return;
}


1;