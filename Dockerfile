FROM golang:1.21.1

WORKDIR /go/src/sample.com/restapi/

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o ./http-server

EXPOSE 9001

CMD [ "./http-server" ]

