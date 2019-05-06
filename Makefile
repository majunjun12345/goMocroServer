build:
	protoc --go_out=plugins=grpc:/Users/majun/go/src/consignment-service proto/consignment/consignment.proto
	GOOS=linux GOARCH=amd64 go build
	docker build -t consignment-service .

run:
	docker run -d -p 50051:50051 consignment-service
