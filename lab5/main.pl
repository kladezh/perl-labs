=pod Вариант 2. Книги.
ID, 
авторы, 
название, 
раздел УДК, 
раздел (техническая, общественно-политическая и т.п.), 
место и год издания, 
издательство, 
количество страниц, 
есть ли иллюстрации, 
цена, 
дата покупки.
=cut

use utf8;

use feature 'switch';

use lib '.';
use Table;


my $table = new Table;

system("clear");
while (1) {
    print "\n
0. Выход;
1. Считать таблицу из файла;
2. Записать таблицу в файл;
3. Вывести таблицу;
4. Добавить запись;
5. Удалить запись;
6. Отсортировать таблицу;
7. Отфильтровать таблицу;\n\n";

    print "Выберите команду: ";

    my $choice = <>; chomp $choice;

    given ($choice) {
        when (0) {
            print "Программа успешно завершена...";
            exit 0;
        }
        when (1) {
            print "Введите имя файла: ";
            my $filename = <>; chomp $filename;

            my $error = $table->from_file($filename);
            print $error eq 0 ? "Таблица успешно прочитана!" : "Ошибка: $error.";
        }
        when (2) {
            print "Введите имя файла: ";
            my $filename = <>; chomp $filename;

            my $error = $table->to_file($filename);
            print $error eq 0 ? "Таблица успешно записана в файл!" : "Ошибка: $error.";
        }
        when (3) {
            $table->print();
        }
        when (4) {
            my @headers = $table->headers;
            my %row;

            print "Введите значения:\n";
            foreach my $header (@headers) {
                print "$header: ";
                my $value = <>; chomp $value;

                $row{$header} = $value;
            }

            my $error = $table->add(\%row);
            print $error eq 0 ? "Запись успешно добавлена!" : "Ошибка: $error. Запись не добавлена.";
        }
        when (5) {
            print "Введите ID: ";
            my $id = <>; chomp $id;

            my $error = $table->remove($id);
            print $error eq 0 ? "Запись успешно удалена!" : "Ошибка: $error.";
        }
        when (6) {
            my @headers = $table->headers;

            print "[$_] $headers[$_]\n" for 0 .. $#headers;

            print "Выберите столбец для сортировки: ";
            my $index = <>; chomp $index;

            my $sorted_table = $table->sort($index);
            $sorted_table->print;
        }
        when (7) {
            print "Введите строку вида 'столбец => значение1, значение2':\n";
            my $input = <>; chomp $input;

            my ($header, $values_str) = split /\s*=>\s*/, $input;
            my @values = split /\s*,\s*/, $values_str;

            my $filtered_table = $table->filter($header, \@values);
            $filtered_table->print;

        }
        default {
            print "Неверно веденная команда.\n";
        }
    }
}