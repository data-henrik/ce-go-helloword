FROM golang:alpine AS builder

#WORKDIR $GOPATH/
COPY helloworld.go .
RUN go build -o /go/app

FROM scratch

COPY --from=builder /go/app /go/app

CMD ["/go/app"]