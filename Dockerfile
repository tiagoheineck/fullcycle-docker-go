FROM golang:1.22rc2-alpine3.19

WORKDIR /go/src/app

COPY . .

RUN go build -o /go/bin/app main.go

CMD ["/go/bin/app"]