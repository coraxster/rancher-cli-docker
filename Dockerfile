FROM alpine:3.7 as alpine

ADD https://github.com/rancher/cli/releases/download/v0.6.13/rancher-linux-amd64-v0.6.13.tar.gz rancher-linux-amd64-v0.6.13.tar.gz
RUN tar -xf rancher-linux-amd64-v0.6.13.tar.gz && \
    ls && \
    rm rancher-linux-amd64-v0.6.13.tar.gz && \ 
    mv rancher-v0.6.13/rancher /usr/bin/rancher && \
    chmod a+x /usr/bin/rancher

FROM scratch
COPY --from=alpine /usr/bin/rancher /usr/bin/rancher

WORKDIR /workspace
ENTRYPOINT ["/usr/bin/rancher"]