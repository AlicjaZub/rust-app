FROM rust:latest AS builder

WORKDIR /app
COPY . .

RUN cargo build --release

FROM debian:bookworm-slim

WORKDIR /app
COPY --from=builder /app/target/release/rust-app /app/

CMD ["./rust-app"]

# ENV ROCKET_ADDRESS=0.0.0.0
# ENV ROCKET_PORT=8000

# EXPOSE 8000