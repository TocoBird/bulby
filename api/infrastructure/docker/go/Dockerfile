FROM golang:1.19-alpine


RUN apk update && apk add make vim mysql-client

# golang
WORKDIR /gin-sample
ENV GO111MODULE on

# golang lib
RUN go install github.com/mgechev/revive@latest
