test:
	go test ./...

build:
	go build -o bin/sample-app ./...

dbuild:
	docker build -t setheck/sample-app:latest .

drun: dbuild
	docker run --rm setheck/sample-app:latest

clean:
	rm -rf bin