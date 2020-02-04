##### 1. Make the build

FROM golang:latest as builder

LABEL maintainer="Pete Houston <contact@petehouston.com"

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .


##### 2. Deploy the build to a smaller image, alpine

FROM alpine:latest

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /app/main .

EXPOSE 8080

CMD ["./main"]

