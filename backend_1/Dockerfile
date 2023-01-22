FROM golang:1.18-alpine as builder

WORKDIR /go/src/app
ADD ./ ./
RUN go get
RUN go build -o main .


FROM alpine as runner
COPY --from=builder /go/src/app/main /app/main
ENTRYPOINT [ "/app/main" ]