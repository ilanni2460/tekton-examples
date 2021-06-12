FROM golang:1.15  AS builder
WORKDIR /opt/
COPY . .
RUN go env -w GO111MODULE=on &&  GOOS=linux go build  -o /opt/app .

FROM alpine:latest
COPY --from=builder /opt/app .
CMD ["./app"]