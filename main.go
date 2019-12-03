package main

import (
	"fmt"
	"net/http"
	"os"
)

const (
	// ContainerEnvVarName Defines an environment variable name
	containerEnvVarName = "CONTAINER_NAME"
)

func main() {
	http.HandleFunc("/", serve)
	http.ListenAndServe(":8080", nil)
}

func serve(w http.ResponseWriter, r *http.Request) {
	containerName := os.Getenv(containerEnvVarName)
	if containerName == "" {
		containerName = "an unnamed container"
	}

	fmt.Fprintln(w, fmt.Sprintf("Hello, CS506 from %s", containerName))
}
