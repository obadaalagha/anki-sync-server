FROM rust:1.79.0-bookworm

WORKDIR /usr/local/anki

RUN apt update && apt upgrade -y

# Install dependencies - curl, git, unzip
RUN apt install curl git unzip -y

# Install protoc
RUN curl -o protoc-27.2.zip -LsSf https://github.com/protocolbuffers/protobuf/releases/download/v27.2/protoc-27.2-linux-x86_64.zip

# Unzip protobufs into folder
RUN unzip protoc-27.2.zip -d protoc-27.2

# Add protoc to PATH
ENV PATH="/usr/local/anki/protoc-27.2/bin:$PATH"
RUN echo 'export "PATH=$PATH:/usr/local/anki/protoc-27.2/bin"' >> "$HOME/.bashrc"

# Install Anki Sync Server
RUN cargo install --git https://github.com/ankitects/anki.git --tag 24.06.3 anki-sync-server

LABEL version="1.0.3"
LABEL description="Anki Sync Server Rust 24.06.3 within a Debian-based Rust container"
