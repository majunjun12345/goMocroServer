build:
	#protoc --go_out=plugins=micro:. /Users/majun/go/src/consignment-service proto/consignment/consignment.proto
	GOOS=linux GOARCH=amd64 go build
	docker build -t consignment-service .

run:
	docker run -d -p 50051:50051 \
	-e MICRO_SERVER_ADDRESS=:50051 \
	-e MICRO_REGISTRY=mdns consignment-service
