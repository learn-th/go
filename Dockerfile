FROM golang:1.21rc2-alpine3.18 as builder

WORKDIR /usr/app

COPY *.go .

RUN go mod init main && go build


FROM scratch
WORKDIR /app
COPY --from=builder /usr/app/main .
CMD ["/app/main"]