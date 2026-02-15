# docker-sqlite-cmake-builder
Automated SQLite3 shared library build system using CMake and Docker.
(Автоматизированная система сборки динамической библиотеки SQLite3 с использованием CMake и Docker.)

## Инструкция по сборке SQLite.so через Docker:

1) Перейдите в папку с проектом и исходниками
2) Выполните команду docker build -t sqlite-builder .
3) Т.к сборка происходит внутри контейнера копируем библиотеку на хост-машину:

Если у вас linux: docker run --rm --entrypoint cat sqlite-builder /app/build/SQLite.so > SQLite.so

Если у вас Windows в Powershell:
docker run --rm --entrypoint cat sqlite-builder /app/build/SQLite.so | Set-Content -Encoding Byte SQLite.so

4) Проверка (опционально) 
Чтобы убедиться в доступности файла внутри образа:
docker run --rm sqlite-builder ls -lh build/
