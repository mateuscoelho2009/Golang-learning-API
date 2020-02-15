package main

import (
    "log"
    "net/http"
    "github.com/gorilla/mux"
)

// função principal
func main() {
    router := mux.NewRouter()
    log.Fatal(http.ListenAndServe(":4000", router))
}