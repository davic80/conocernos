package main

import (
	"database/sql"
	"embed"
	"encoding/json"
	"io/fs"
	"log"
	"net/http"
	"os"

	_ "modernc.org/sqlite"
)

//go:embed static
var staticFiles embed.FS

//go:embed seed.sql
var seedSQL string

type Question struct {
	ID       int    `json:"id"`
	Category string `json:"category"`
	Level    string `json:"level"`
	Text     string `json:"text"`
	Audience string `json:"audience"`
}

var db *sql.DB

func main() {
	var err error
	db, err = sql.Open("sqlite", "file::memory:?cache=shared")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	if _, err := db.Exec(seedSQL); err != nil {
		log.Fatalf("seed: %v", err)
	}

	staticFS, err := fs.Sub(staticFiles, "static")
	if err != nil {
		log.Fatal(err)
	}

	mux := http.NewServeMux()
	mux.Handle("/", http.FileServer(http.FS(staticFS)))
	mux.HandleFunc("/api/questions", handleQuestions)
	mux.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("ok"))
	})

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	log.Printf("conocernos escuchando en :%s", port)
	if err := http.ListenAndServe(":"+port, mux); err != nil {
		log.Fatal(err)
	}
}

func handleQuestions(w http.ResponseWriter, r *http.Request) {
	rows, err := db.Query("SELECT id, category, level, text, audience FROM questions ORDER BY id")
	if err != nil {
		http.Error(w, err.Error(), http.StatusInternalServerError)
		return
	}
	defer rows.Close()

	questions := make([]Question, 0, 260)
	for rows.Next() {
		var q Question
		if err := rows.Scan(&q.ID, &q.Category, &q.Level, &q.Text, &q.Audience); err != nil {
			http.Error(w, err.Error(), http.StatusInternalServerError)
			return
		}
		questions = append(questions, q)
	}

	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	w.Header().Set("Cache-Control", "public, max-age=3600")
	json.NewEncoder(w).Encode(questions)
}
