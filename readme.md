# Let's Dockernize lapis
Lapis 응용 프로그램을 Docker로 실행합니다

## Make Docker image
build 디렉토리를 통해 docker image를 제작합니다.
[MillesChou](https://github.com/MilesChou/docker-lapis) 님의 Dockerfile을 참고했습니다.

## How to use
### Create a basic application with moonscript
```bash
docker run \
  -p 8080 \
  -w /app \
  --mount type=bind,source="$(pwd)"/src,target=/app \
  --rm -it lapis:1.12.0-1 lapis new --moonscript --git
```   

### lapis server
#### Run directly from lapis image
```
docker run \
  -p 8080 \
  -w /app \
  --mount type=bind,source="$(pwd)"/src,target=/app \
  --mount type=bind,source="$(pwd)"/logs,target=/var/log/openresty \
  --rm -it lapis:1.12.0-1 lapis serverß
```
or
```
docker compose run app moonc .
docker compose up
```

> [!warning] 페이지가 열리지 않는 경우 포트를 8080외의 다른 것으로 바꿔서 실행하십시오.

### Build an image
Dockerfile 및 docker-compose.yml 을 참고

## docker-compose로 실행하기