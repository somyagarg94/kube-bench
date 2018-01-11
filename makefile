SOURCES := $(shell find . -name '*.go')
TARGET_OS := darwin
BINARY := kube-bench
GOARCH := amd64
GOARM := 7

$(BINARY): $(SOURCES)
	GOOS=$(TARGET_OS) $(GOARCH) $(GOARM) go build -o $(BINARY) .

