FROM alpine:latest

RUN apk add --no-cache cmake build-base

WORKDIR /app
COPY . .

RUN cmake -B build && cmake --build build

CMD ["ls", "-la", "build/"]
