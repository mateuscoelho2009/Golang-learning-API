package main

import (
	"log"
	"net/http"
	"github.com/gorilla/mux"
	ContactRoutes "golang-api/contact/routes"
)

// função principal
func main() {
	router := mux.NewRouter()
	
	// Routes
	ContactRoutes.AddContactRoutes(router)

    log.Fatal(http.ListenAndServe(":4000", router))
}