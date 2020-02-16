# Builder
FROM golang:1.10-alpine as builder
WORKDIR /go/src/golang-api

RUN apk update && \
    apk add git \
            make

COPY ./scripts ./scripts
COPY Makefile .
COPY ./src/go.dependencies .

RUN make resolve-dependencies

COPY ./src .
RUN go build -o go_app ./main.go

# App Image
FROM alpine:3.7
WORKDIR /app
EXPOSE 4000
COPY --from=builder /go/src/golang-api/go_app .
CMD ["/app/go_app"]