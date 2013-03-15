# language: ru
Функционал: тестовый
  Сценарий: открыть
    Пусть страница "dynamic url page" открыта с параметрами "domain = www.google.com, path = advanced_search"
    И открыта страница "some test page"
    И страницу "dynamic URL Page" открыть с параметрами "domain = google.com, path = advanced_search"
    И открыть страницу "some test page"

  Сценарий: ввод данных
    Пусть на странице введены данные типа "loud"
    И в набор элементов "test elements" введены данные типа "loud"
    И на форме "test elements" введены данные типа "loud"
    К тому же в поле "tf" введено значение "123"
    И на странице ввести данные типа "quite"
    И в набор элементов "test elements" ввести данные типа "quite"
    И на форме "test elements" ввести данные типа "loud"
    И в поле "tf" ввести значение "вввввввввввввввввввввввввввввввв"
    
  Сценарий: действие
    Пусть выполнено действие "press cool button"
    Если открыть страницу "some test page"
    Если выполнить действие "press cool button"
    И открыть страницу "some test page"
    Пусть действие "fill text area" выполнено с параметрами "значение = qqqqqqqqqqq"
    И действие "fill text area" выполнить с параметрами "значение = wwwwwwwwwwwwww"

  Сценарий: нажатие
    Допустим была нажата кнопка "cool button"
    Если открыть страницу "some test page"
    И нажать на элемент "cool button"
       
