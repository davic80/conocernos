FROM --platform=$BUILDPLATFORM golang:1.23-alpine AS builder

ARG TARGETOS
ARG TARGETARCH

WORKDIR /build

COPY go.mod ./
RUN go mod download || true

COPY . .
RUN go mod tidy

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} \
    go build -trimpath -ldflags="-s -w" -o /conocernos .

FROM scratch
COPY --from=builder /conocernos /conocernos
EXPOSE 8080
ENV PORT=8080
ENTRYPOINT ["/conocernos"]
