FROM golang:1.15  AS builder
RUN go env -w GO111MODULE=on &&  GOOS=linux go build  -o app .

FROM alpine:latest
COPY --from=builder app .
CMD ["./app"]