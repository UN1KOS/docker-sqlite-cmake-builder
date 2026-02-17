Инструкция по сборке SQLite.so через Docker:
# Примечание! Если у вас ошибка прав доступа на Linux используйте sudo в начале команд.

1) Перейдите в папку с проектом и исходниками
2) Выполните команду docker build -t sqlite-builder .
3) Выполните команду, чтобы запустить контейнер и скопировать файл библиотеки на хост-машину:

Если у вас Linux:
docker run --rm --entrypoint cat sqlite-builder /app/build/SQLite.so > SQLite.so

Если у вас Windows выполните эти 3 команды:
docker create --name tmp-container sqlite-builder
docker cp tmp-container:/app/build/SQLite.so ./SQLite.so
docker rm tmp-container

__________________________________________________________________________________________________
ошибки при сборке CMake
1) была ошибка "No CMAKE_CXX_COMPILER could be found":
Пояснение: CMake пытался найти компилятор для C++ 
Решение: Явно указать язык в настройках проекта project(<имя_проекта> C)
2) было предупреждение на этапе сборки: warning: function may return address of local variable [-Wreturn-local-addr]
Пояснение: внутренее предупреждение кода самого SQLite. На строке 124086 в файле sqlite3.c
Решение: нет т.к не мешает сборке
3) Была ошибка: cannot find -lld
Пояснение: cmake не смог найти системную библиотеку dl
Решение: добавил в CMakeLists.txt директорию проекта как место для поиска и написал корректное имя библиотеки