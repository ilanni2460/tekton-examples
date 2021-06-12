FROM golang:1.15  AS builder
WORKDIR /opt/
COPY vendor /opt/vendor
COPY main.go /opt/main.go
COPY main_test.go /opt/main_test.go
COPY go.mod /opt/go.mod
RUN go env -w GO111MODULE=on &&  GOOS=linux go build  -o /opt/app .

FROM alpine:latest
COPY --from=builder /opt/app .
CMD ["./app"]