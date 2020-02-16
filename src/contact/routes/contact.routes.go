package routes

import (
    "github.com/gorilla/mux"
    "golang-api/contact/controllers"
)

func AddContactRoutes(router *mux.Router) {
	router.HandleFunc("/contacts", controllers.GetContacts).Methods("GET")
    router.HandleFunc("/contacts/{id}", controllers.GetContact).Methods("GET")
    router.HandleFunc("/contacts/{id}", controllers.CreateContact).Methods("POST")
    router.HandleFunc("/contacts/{id}", controllers.DeleteContact).Methods("DELETE")
}