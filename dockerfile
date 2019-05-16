# Stage 1
FROM microsoft/dotnet:2.2-sdk as builder

WORKDIR /source

RUN set -ex && \
    git clone https://github.com/Sebreiro/IpNotifier . && \
    dotnet restore src && \
    dotnet publish src --output /app/ --configuration Release

#Stage 2
FROM microsoft/dotnet:2.2-runtime

WORKDIR /app

COPY --from=builder /app .

COPY files .

# sycn solves the bug: https://github.com/moby/moby/issues/9547
RUN set -ex && \
    chmod +x install.sh && \
    chmod +x ./entrypoint.sh && \
    sync && \ 
    ./install.sh

VOLUME ["app/Config"]
VOLUME ["app/Log"]

ENTRYPOINT ["/app/entrypoint.sh"]