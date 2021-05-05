FROM golang:1.16.3-alpine3.13 as build

ENV GO111MODULE=on
ENV GO15VENDOREXPERIMENT=1
ENV CLI53_VER_TAG='0.8.17'

WORKDiR $GOPATH/src
RUN apk add --no-cache --virtual .build-deps git && \
    git clone git://github.com/barnybug/cli53 --branch $CLI53_VER_TAG && \
    cd cli53/cmd/cli53 && \
    go build -a -tags "netgo" -installsuffix netgo -ldflags="-s -w -extldflags \"-static\"" && \
    mv cli53 /bin/cli53 && \
    apk del .build-deps


FROM alpine:latest

LABEL maintainer Taku Izumi <admin@orz-style.com>

WORKDIR /opt/ddns_update
RUN apk add --no-cache curl jq
COPY --from=build /bin/cli53 /bin/cli53
COPY ./source .

CMD ["/opt/ddns_update/ddns_update.sh"]
