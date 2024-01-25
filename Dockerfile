FROM golang:1.22rc2-alpine3.19 as builder

WORKDIR /go/src/app

COPY . .

RUN go build -o /go/bin/app main.go

FROM alpine:latest as runnner

COPY --from=builder /go/bin/app /go/bin/app

CMD ["/go/bin/app"]