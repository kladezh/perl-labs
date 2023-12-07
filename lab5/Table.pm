package Table;

use utf8;
use open qw(:std :utf8);

# конструктор
sub new {
    my $class = shift;
    my $self = {
        headers => shift, # массив строк
        rows   => shift, # массив ссылок на хеши
    };
    bless $self, $class;
    return $self;
}

# получить заголовок по индексу
sub _header_by($) {
    my ($self, $index) = @_;
    return $self->{headers}->[$index];
}

# прочитать данные из потока по разделителю
sub _read($) {
    my ($self, $delimiter, $in) = @_;

    $self->{headers} = [split "\t", <$in>];
    $self->{rows} = [];

    while (my $line = <$in>) {
        chomp $line;

        my %hash;

        my @row = split "\t", $line;
        for my $i (0 .. $#row) {
            $hash{ $self->{headers}[$i] } = $row[$i];
        }

        push @{$self->{rows}}, \%hash;
    }
}

# вывести с разделителем в поток
sub _write($) {
    my ($self, $delimiter, $out) = @_;

    # Вывод заголовков
    print $out join($delimiter, @{$self->{headers}});

    # Вывод данных
    for my $row (@{$self->{rows}}) {
        print $out join($delimiter, @{$row}{@{$self->{headers}}}), "\n";
    }
}

# получить заголовки 
sub headers {
    my ($self) = @_;
    return @{$self->{headers}};
}

# добавить запись
sub add($) {
    my ($self, $row) = @_;

    for my $existing_row (@{$self->{rows}}) {
        if ( $existing_row->{"ID"} == $row->{"ID"} ) {
            return "Запись с ID = $row->{'ID'} уже существует";
        }
    }

    my $is_valid = 1; $is_valid &&= exists $row->{$_} for @{$self->{headers}};
    if (not $is_valid) {
        return "Несоответсвие столбцов переданной записи";
    }

    push @{$self->{rows}}, $row;
    return 0;
}

# удалить запись по ID
sub remove($) {
    my ($self, $id) = @_;

    my @filtered_rows = grep { $_->{"ID"} != $id } @{$self->{rows}};

    if (scalar(@filtered_rows) == scalar(@{$self->{rows}})) {
        return "Не найдена запись с ID = $id";
    } 

    $self->{rows} = \@filtered_rows;
    return 0;
}

# считать с файла данные
sub from_file($) {
    my ($self, $filename) = @_;

    open my $file, '<:utf8', "./$filename" or return $!;

    $self->_read("\t", $file);

    close $file;

    return 0;
}

# записать в файл
sub to_file($) {
    my ($self, $filename) = @_;

    open my $file, '>:utf8', "./$filename" or return $!;

    $self->_write("\t", $file);

    close $file;

    return 0;
}

# вывести с разделителем '|' в консоль
sub print {
    my ($self) = @_;

    $self->_write(" | ", STDOUT);
}

# остортировать по столбцу с указаным номером
sub sort($) {
    my ($self, $header_i) = @_;

    my $sorted = $self->_header_by($header_i);

    my @sorted_rows = sort { $a->{$sorted} cmp $b->{$sorted} } @{$self->{rows}};

    return new Table($self->{headers}, \@sorted_rows);
}

# отфильтровать по части запроса
sub filter($) {
    my ($self, $filtered_header, $filtered_values) = @_;

    my @filtered_rows;

    for my $row (@{$self->{rows}}) {
        if ( grep { $row->{$filtered_header} =~ /$_/i } @$filtered_values ) {
            push @filtered_rows, $row;
        }
    }

    return new Table($self->{headers}, \@filtered_rows);
}

1;