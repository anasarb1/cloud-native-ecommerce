all: help

.PHONY: help dev stop reset logs deploy test build-frontend build-backend

help:
	@echo "Usage: make <command>"
	@echo ""
	@echo "Commands:"
	@echo "  dev           - Start local development environment"
	@echo "  stop          - Stop local development environment"
	@echo "  reset         - Stop and remove local development environment data"
	@echo "  logs          - View logs for all services"
	@echo "  deploy        - Deploy to AWS (requires AWS credentials and Terraform setup)"
	@echo "  test          - Run tests (placeholder)"
	@echo "  build-frontend - Build frontend Docker image"
	@echo "  build-backend  - Build backend Docker image"

dev:
	docker-compose up --build

stop:
	docker-compose down

reset:
	docker-compose down -v --remove-orphans

logs:
	docker-compose logs -f

deploy:
	@echo "Deploying to AWS... (This command assumes you have AWS credentials configured and Terraform applied)"
	# Placeholder for actual deployment steps (e.g., terraform apply, kubectl apply)
	# cd terraform && terraform apply --auto-approve
	# cd ../kubernetes && kubectl apply -f .

test:
	@echo "Running tests... (Placeholder)"
	# Add your test commands here

build-frontend:
	docker build -t ecommerce-frontend -f docker/frontend/Dockerfile .

build-backend:
	docker build -t ecommerce-backend -f docker/backend/Dockerfile .


