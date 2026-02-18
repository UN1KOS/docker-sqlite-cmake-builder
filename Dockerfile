FROM debian:stable-slim

RUN apt update && apt install -y --no-install-recommends \
  gcc \
  cmake \
  libc6-dev \ 
  make \ 
  && rm -rf  /var/lib/apt/lists/*

 
WORKDIR /app
COPY . .

RUN cmake -B build && cmake --build build

RUN ldd build/SQLite.so

CMD ["ls", "-la", "build/"]
