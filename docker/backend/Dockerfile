### Stage 1: Build dependencies
FROM python:3.9-slim-buster AS builder
WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

### Stage 2: Create final image
FROM python:3.9-slim-buster
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY . .

# Create a non-root user and switch to it
RUN adduser --system --group appuser
USER appuser

EXPOSE 5000
CMD ["python", "app.py"]

# Health check (optional, for Kubernetes)
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl -f http://localhost:5000/health || exit 1


