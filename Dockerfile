FROM golang:1.22rc2-alpine3.19 as builder

WORKDIR /go/src/app

COPY . .

RUN go build -ldflags "-w -s" -gcflags=all=-l  -gcflags=all=-B  -gcflags=all=-wb=false -o /go/bin/app main.go

FROM alpine:2.6 as runnner

COPY --from=builder /go/bin/app /app

CMD ["/app"]