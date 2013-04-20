# language: ru
Функционал: тестовый
  Сценарий: открыть
    * страница "dynamic url page" открыта с параметрами "domain = www.google.com, path = advanced_search"
    * открыта страница "some test page"
    * открыт диалог "some test page"
    * страницу "dynamic URL Page" открыть с параметрами "domain = google.com, path = advanced_search"
    * открыть новое окно браузера
    * открыть страницу "some test page"

  Сценарий: ввод данных
    * в набор элементов "test elements" введены "loud"
    * на форме "test elements" введены "loud"
    * в поле "tf" введено "123"
    * на странице ввести "quite"
    * в набор элементов "test elements" ввести "quite"
    * на форме "test elements" ввести "loud"
    * в поле "tf" ввести "вввввввввввввввввввввввввввввввв"
    * значение поля "tf" равно "вввввввввввввввввввввввввввввввв"
    * на странице введены "loud"
    
  Сценарий: действие
    * выполнено "press cool button"
    * открыть страницу "some test page"
    * выполнить "press cool button"
    * открыть страницу "some test page"
    * "fill text area" выполнено с параметрами "значение = qqqqqqqqqqq"
    * "fill text area" выполнить с параметрами "значение = wwwwwwwwwwwwww"
    * "fill text area" выполнить с параметрами "eeeeeeee"
    * результат запомнить как "_текущее_значение_"
    * "_текущее_значение_" равно "eeeeeeee"
  Сценарий: непроходящий
    * "fill text area" выполнить с параметрами "eeeeeeee"
    * результат запомнить как "_текущее_значение_"
    * "_текущее_значение_" равно "e"

  Сценарий: нажатие
    * открыта страница "some test page"
    * была нажата кнопка "cool button"
    * открыть страницу "some test page"
    * нажать на элемент "cool button"
    * открыть страницу "some test page"
    * нажать ссылку "cool button"
  
  Сценарий: работа с таблицей
    * открыта страница "some test page"
    * в таблице "countries" была выбрана ячейка колонки "country" с "total_area" равным "337,030"
    * в таблице "countries" была выбрана ячейка колонки "country" с "total_area" похожим на "337,030"
    * в таблице "countries" была выбрана ячейка с "total_area" равным "337,030"
    * в таблице "countries" была выбрана ячейка с "total_area" похожим на "337,030"
    * в таблице "countries" был выбран элемент колонки "country"
    * в таблице "countries" был выбран элемент колонки "country" из "1" строки
    * текст ячейки "country" равен "Denmark"
    * текст ячейки "country" запомнить как "_first_country_"
    * "_first_country_" равно "Denmark"
    * в таблице "countries" есть строка:
      |Country|
      |Denmark|
    * нажать на ячейку "Land Area"
    * текст ячейки "Land Area" равен "42,370"
    * текст ячейки "Land Area" запомнить как "_land_area_"
    * "_land_area_" равно "42,370"
  Сценарий: непроходящий
    * в таблице "countries" есть строка:
      |Country|
      |Denmark|
    * текст ячейки "Land Area" запомнить как "_land_area_"
    * "_land_area_" равно "1"
  Сценарий: непроходящий
    * в таблице "unknown" есть строка:
      |Country|
      |Denmark|
  Сценарий: непроходящий
    * в таблице "countries" есть строка:
      |unknown|
      |Denmark|
  Сценарий: непроходящий
    * в таблице "countries" есть строка:
      |Country|
      |unknown|

  Сценарий: работа с пагинацией
    * открыта страница "google search results"
    * открыта "3" страница пагинации
    * на каждой странице пагинации выполнить "нажатие на поиск"
    * перейти на "5" страницу пагинации
    * на первых "2" страницах пагинации выполнить "нажатие на поиск"

  Сценарий: валидатор
    * открыта страница "some test page"
    * открывается страница "some test page"
    * открывается диалог "some test page"
    * "значение хедера" вернет "Testing display of HTML elements"
    * "populate_text_field" вернет ""
    * выполнение "fill text area" с параметрами "value = 123" вернет "123"
    * результат запомнить как "_значение_"
    * "_значение_" равно "123"
    * выполнение "fill text area" с параметрами "value" вернет "value"
    * в "0" строке колонки "country" таблицы "countries" содержится "Country"
    * в колонке "total_area" таблицы "countries" с "country" равным "Norway" содержится "324,220"
    * в колонке "total_area" таблицы "countries" с "country" похожим на "Nor" содержится "324,220"
    * проверить "верное значение хедера"
  Сценарий: непроходящий
    * проверить "значение хедера"
