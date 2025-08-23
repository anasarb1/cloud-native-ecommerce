## To-Do List for Cloud-Native E-commerce Repository Professionalization

### Phase 1: Analyze existing repository and plan changes
- [x] Read and analyze uploaded content (done in previous turn)
- [x] Clone the repository
- [x] List files in the repository
- [x] Read existing README.md
- [ ] Create todo.md (this file)

### Phase 2: Improve README.md
- [x] Add badges (Build Passing, License, Terraform Validate, Docker).
- [x] Add a clear "Quick Start" section for local setup using Docker Compose.
- [x] Add a "Cloud Deployment" section with Terraform + GitHub Actions steps.
- [x] Include an architecture diagram (use the existing one from the repo) with an explanation.
- [x] Add screenshots placeholders for app demo.
- [x] Add sections for Tech Stack, Features, and CI/CD overview.

### Phase 3: Create Local Development Setup
- [x] Add `docker-compose.yml` for local dev with backend, frontend, and Postgres.
- [x] Add `.env.example` with necessary variables.
- [x] Add `Makefile` with commands: `make dev`, `make stop`, `make reset`, `make logs`, `make deploy`.

### Phase 4: Create Production Setup
- [x] Add optimized Dockerfiles (multi-stage builds, non-root user, health checks) for frontend and backend in `docker/`.
- [x] Add `docker-compose.prod.yml` for production simulation.

### Phase 5: Implement CI/CD Workflow
- [x] Create `.github/workflows/ci-cd.yml`:
  - [x] Validate Terraform (fmt, init, validate).
  - [x] Build and push Docker images to AWS ECR (use OIDC for auth, no static AWS keys).
  - [x] Deploy to EKS cluster using `kubectl apply`.
- [x] Add CodeQL workflow for security scanning.
- [x] Add Dependabot config for npm, Docker, and GitHub Actions.

### Phase 6: Implement Security and Observability
- [x] Add Prometheus and Grafana K8s manifests to `kubernetes/monitoring`.
- [x] Provide a sample Grafana dashboard JSON for app metrics.
- [x] Add pre-commit hook recommendations for Terraform fmt, npm lint, and secret scanning.

### Phase 7: Polish for Recruiters
- [x] Add CONTRIBUTING.md, ISSUE_TEMPLATE, and SECURITY.md.
- [x] Add LICENSE (MIT) if not present.
- [x] Add a short Loom or GIF placeholder in README for "Demo".

### Phase 8: Commit and push all changes
- [ ] Commit all changes with logical commit messages.
- [ ] Push changes to the GitHub repository.

### Phase 9: Summarize changes and inform user
- [ ] Summarize all changes made.
- [ ] Inform the user about the completion of the task.


