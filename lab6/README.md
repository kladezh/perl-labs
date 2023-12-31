### Лабораторная работа 6 (Классы)

> В рамках класса реализовать конструктор с параметрами и без параметров. 

> Описать метод для получения состояния объекта. 

> Исходные данные для массива объектов считываются из файла.  Описывать нужные классы в модульных файлах .pm. 

> Предусмотреть возможность добавления и удаления данных из массива объектов.

### Задачи по вариантам

1. Классы **Вокзал** и **Поезд**.

Описать класс **Поезд**, cодержащий следующие закрытые поля: 
   - название пункта назначения; 
   - номер поезда (может содержать буквы и цифры);
   - время отправления.

Предусмотреть свойства для получения состояния объекта.

Класс **Вокзал** содержит закрытый массив поездов и имя вокзала. Обеспечить 
следующие возможности:
   - вывод информации о поезде по номеру с помощью индекса;
   - перегруженную операцию сравнения, выполняющую сравнение времени отправления двух поездов;
   - вывод информации о поездах, отправляющихся в заданный пункт назначения.

Написать программу, демонстрирующую все разработанные элементы классов.

2. Классы **Товар** и **Склад**.

Описать класс **Товар**, содержащий следующие закрытые поля:
   - название товара;
   - название магазина, в котором продается товар;
   - тоимость товара в рублях.

Предусмотреть свойства для получения состояния объекта.

Описать класс **склад**, содержащий закрытый массив товаров. Обеспечить следующие возможности:
   - вывод информации о товаре по номеру с помощью индекса;
   - вывод на экран информации о товаре, название которого введено с клавиатуры; если 
   - таких товаров нет, выдать соответствующее сообщение;
   - перегруженную операцию сложения товаров, выполняющую сложение их цен.

Написать программу, демонстрирующую все разработанные элементы классов.

3. Классы **Самолет** и **Аэропорт**.

Описать класс **Самолет**, содержащий следующие закрытые поля:
   - название пункта назначения;
   - шестизначный номер рейса;
   - время отправления.

Предусмотреть свойства для получения состояния объекта.

Описать класс **Аэропорт**, содержащий закрытый массив самолетов. Обеспечить следующие возможности:
   - вывод информации о самолете по номеру рейса с помощью индекса; 
   - вывод информации о самолетах, отправляющихся в заданный пункт назначения;
   - перегруженную операцию сравнения, выполняющую сравнение времени отправления двух самолетов.

Написать  программу, демонстрирующую все разработанные элементы классов.

4. Классы **Запись** и **Записная Книжка**.

Описать класс **Запись**, содержащий следующие закрытые поля:
   - фамилия, имя;
   - номер телефона;
   - дата рождения (массив из трех чисел).

Предусмотреть свойства для получения состояния объекта.

Описать класс **Записная Книжка**, содержащий закрытый массив записей. Обеспечить следующие возможности:
   - вывод на экран информации о человеке, номер телефона которого введен с клавиатуры; 
   - если такого нет, выдать на дисплей соответствующее сообщение;
   - поиск людей, номер телефона которых начинается на три заданных цифры;
   - перегруженную операцию сравнения, выполняющую сравнение по году рождения.

Написать программу, демонстрирующую все разработанные элементы классов.

5. Классы **Книга** и **Домашняя Библиотека**.

Описать класс **Книга**, содержащий следующие закрытые поля: 
   - автор;
   - год издания;
   - жанр.

Предусмотреть свойства для получения состояния объекта.

Описать класс **Домашняя Библиотека**. Обеспечить следующие возможности:
   - вывод информации о книге по номеру с помощью индекса;
   - поиска книг по какому-либо признаку (по автору, по году издания или жанру), 
   - перегруженную операцию сравнения, выполняющую сравнение книг по году издания

Написать программу, демонстрирующую все разработанные элементы класса.

6. Классы **Автомобиль** и **Автостоянка**.

Описать класс **Автомобиль**, содержащий следущие закрытые поля:
   - госномер;
   - цвет;
   - фамилия владельца;
   - признак присутствия на стоянке.

Предусмотреть свойства для получения состояния объекта.

Описать класс **Автостоянка** для хранения сведений об автомобилях. Обеспечить следующие возможности: 
   - поиска автомобиля по разным критериям (см. примеры поиска в вариантах 1-4), 
   - перегруженную логическую операцию `!`, меняющую признак присутствия на стоянке и 
   - вывод списка присутствующих и отсутствующих на стоянке автомобилей,
   - доступа к имеющимся сведениям по номеру места. 

Написать программу, демонстрирующую все разработанные элементы класса.