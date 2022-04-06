FROM golang AS build

WORKDIR /app

ADD pebble/ .

RUN go mod tidy

RUN cd cmd/pebble && CGO_ENABLED=0 go build -buildvcs=false -o pebble -ldflags="-w -s"

FROM ubuntu:22.04

COPY --from=build /app/cmd/pebble/pebble /usr/bin/pebble

ENTRYPOINT [ "pebble" ]