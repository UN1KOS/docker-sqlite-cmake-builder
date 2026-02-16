# docker-sqlite-cmake-builder
Автоматизированная система сборки динамической библиотеки SQLite3 с использованием CMake и Docker.

## Инструкция по сборке SQLite.so через Docker:

# Примечание! Если у вас ошибка прав доступа на Linux используйте sudo в начале команд.
1) Перейдите в папку с проектом и исходниками
2) Выполните команду docker build -t sqlite-builder .
3) Т.к сборка происходит внутри контейнера копируем библиотеку на хост-машину:

Если у вас linux:
docker run --rm --entrypoint cat sqlite-builder /app/build/SQLite.so > SQLite.so

Если у вас Windows в Powershell:
docker run --rm --entrypoint cat sqlite-builder /app/build/SQLite.so > SQLite.so

4) Проверка (опционально) 
Чтобы убедиться в доступности файла внутри образа:
docker run --rm sqlite-builder ls -lh build/

