FROM lapis:1.12.0-1

EXPOSE 8080

RUN mkdir -p /app
WORKDIR /app

COPY src .
RUN moonc .

CMD ["lapis", "server"]