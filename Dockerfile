FROM rust:latest AS builder

WORKDIR /app
COPY . .

RUN cargo build --release

FROM ubuntu:latest

WORKDIR /app
COPY --from=builder /app/target/release/rust-app /app/

CMD ["./rust-app"]