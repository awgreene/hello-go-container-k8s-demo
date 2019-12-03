# Start from the offical version 1.13.4 golang image
FROM golang:1.13.4

# Document that the service listens on port 8080.
EXPOSE 8080

# Copy the local package files to the container's workspace.
COPY . /go/src/github.com/golang/example/hello-go

# Define an Environment Variable
# ENV CONTAINER_NAME "my go container"

# Build the hello-go command inside the container.
RUN go install github.com/golang/example/hello-go

# Run the hello-go command when the container starts.
ENTRYPOINT /go/bin/hello-go
