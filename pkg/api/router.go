package api

import (
	"net/http"
)

func CreateRouter(port string) {
	http.HandleFunc("/search", RouterSearch())

	http.ListenAndServe(":"+port, nil)
}
