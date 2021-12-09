package main

import (
	"context"
	"log"
	"net/http"
	"os/signal"
	"syscall"
	"time"
)

func main() {
	log.Println("Starting Simple app!")
	ctx, stop := signal.NotifyContext(context.Background(), syscall.SIGINT, syscall.SIGTERM)
	defer stop()

	u := "https://www.google.com"

	for {
		select {
		case <-ctx.Done():
			return
		case <-time.After(time.Second * 5):
			resp, err := http.Get(u)
			if err != nil {
				log.Println("Error:", err)
			} else {
				log.Println("Response from url:", u, "status:", resp.Status)
			}
		}
	}
}
