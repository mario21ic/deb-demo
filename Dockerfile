FROM golang:1.16-alpine as builder
WORKDIR /app
COPY main.go /app/main.go
COPY go.mod /app/go.mod
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch
COPY --from=builder /app/main /main
#CMD ["/main"]
ENTRYPOINT ["/main"]
