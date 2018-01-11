FROM golang:1.9
WORKDIR /kube-bench
RUN go get github.com/somyagarg94/kube-bench

FROM alpine:latest
WORKDIR /
COPY --from=0 /go/bin/kube-bench /kube-bench 
COPY cfg cfg
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="kube-bench" \
    org.label-schema.description="Run the CIS Kubernetes Benchmark tests" \
    org.label-schema.url="https://github.com/aquasecurity/kube-bench" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/aquasecurity/kube-bench" \
    org.label-schema.schema-version="1.0"
