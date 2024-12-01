FROM rust:latest

# Set working directory
WORKDIR /app

# Copy source code into the container
COPY . .

# Build the application in release mode
RUN cargo build --release

# Remove unnecessary files to minimize image size
RUN rm -rf /app/target/debug \
    /app/src \
    /app/.git \
    /app/Cargo.toml \
    /app/Cargo.lock

# Set the entrypoint to the compiled binary
ENV ROCKET_ADDRESS=0.0.0.0
ENV ROCKET_PORT=8000

EXPOSE 8000
CMD ["./target/release/rust-app"]

# FROM debian:bullseye-slim

# WORKDIR /app
# COPY --from=builder /app/target/release/rust-app /app/

# CMD ["./rust-app"]
