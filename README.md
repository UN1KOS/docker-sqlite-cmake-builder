# docker-sqlite-cmake-builder
Автоматизированная система сборки динамической библиотеки SQLite3 с использованием CMake и Docker.

## Инструкция по сборке SQLite.so через Docker:

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

