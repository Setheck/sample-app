FROM golang:alpine AS builder

ENV TZ="America/Los_Angeles"
WORKDIR /build
COPY go.mod .
#COPY go.sum . #don't need it until we need it
RUN go mod download

COPY . .
RUN go build -o app .

FROM alpine

ENV TZ="America/Los_Angeles"
WORKDIR /app

COPY --chown=65534:0 --from=builder /build/app .
USER 65534

WORKDIR /data
ENTRYPOINT ["/app/app"]