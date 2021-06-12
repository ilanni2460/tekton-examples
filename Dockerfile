FROM golang:1.15-alpine  AS builder
WORKDIR /opt/
COPY . .
RUN go env -w GO111MODULE=on && CGO_ENABLED=0 GOOS=linux go build  -o app .

FROM alpine:latest
COPY --from=builder /opt/app .
CMD ["./app"]