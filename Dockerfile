FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache wget

# Download PocketBase during image build
RUN wget https://github.com/pocketbase/pocketbase/releases/download/v0.21.1/pocketbase_0.21.1_linux_amd64.zip && \
    unzip pocketbase_0.21.1_linux_amd64.zip && \
    mv pocketbase /app/pocketbase && \
    chmod +x /app/pocketbase && \
    rm pocketbase_0.21.1_linux_amd64.zip

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
