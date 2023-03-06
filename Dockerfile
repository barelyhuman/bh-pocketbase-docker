FROM golang:1.19-alpine3.16

WORKDIR /app

COPY download.sh .

RUN apk update; apk add curl bash jq tar zip

RUN ./download.sh

EXPOSE 8090

CMD ["./pocketbase","--automigrate","serve","--http=0.0.0.0:8090"]
