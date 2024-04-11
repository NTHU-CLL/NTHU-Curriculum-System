package api

import (
	Basic "NTHU-CCS/pkg/basic"
	"encoding/json"
	"net/http"
)

func RouterSearch() func(http.ResponseWriter, *http.Request) {
	return func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", r.Header.Get("Origin"))
		w.Header().Set("Access-Control-Allow-Methods", "GET, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type")

		switch r.Method {
		case "GET":
			jsonResponse, err := json.Marshal(Basic.SearchCourse())
			if err != nil {
				http.Error(w, err.Error(), http.StatusInternalServerError)
				return
			}

			w.Header().Set("Content-Type", "application/json; charset=utf-8")
			w.WriteHeader(http.StatusOK)
			w.Write(jsonResponse)

		case "OPTIONS":
			w.WriteHeader(http.StatusOK)

		default:
			http.Error(w, "Method not allowed", http.StatusMethodNotAllowed)
		}
	}
}
