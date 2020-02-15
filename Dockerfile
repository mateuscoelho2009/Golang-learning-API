FROM golang:1.10-alpine as builder
WORKDIR /builder

RUN apk update && \
    apk add git \
            make

COPY ./src/go.dependencies ./src/
COPY ./scripts ./scripts/
COPY Makefile .

RUN make resolve-dependencies

COPY . .
RUN go build -o go_app ./src/main.go

FROM alpine:3.7
WORKDIR /app
EXPOSE 4000
COPY --from=builder /builder/go_app .
CMD ["/app/go_app"]