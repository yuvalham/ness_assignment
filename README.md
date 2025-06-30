# ness_assignment
public repo for NESS assignment

[![CI/CD](https://github.com/yuvalham/ness_assignment/actions/workflows/ci-cd.yaml/badge.svg?branch=main&event=push)](https://github.com/yuvalham/ness_assignment/actions/workflows/ci-cd.yaml)

# Hello World .NET 8 CI/CD

A minimal .NET 8 "Hello World" application demonstrating a full CI/CD pipeline with GitHub Actions, Docker containerization, security scanning, and local testing using [`act`](https://github.com/nektos/act).

## Prerequisites

* **.NET 8 SDK** installed locally (verify with `dotnet --version`).

* **Docker** installed and running.

* **Docker Hub account** and a **Personal Access Token**:

  1. Log in to Docker Hub.
  2. Go to **Account Settings → Security → New Access Token**.
  3. Create a token (give it a descriptive name) and copy it.

* **GitHub Actions Runner locally** via [`act`](https://github.com/nektos/act):

  ```bash
  brew install act       # macOS (Homebrew)
  # or
  choco install act      # Windows (Chocolatey)
  ```

## Building the App

```bash
cd src/App/

dotnet build
```

## Running the App Locally

```bash
cd src/App/

dotnet run
```

## Running Tests

```bash
cd tests/App.Tests/

dotnet test
```

## Running the CI/CD Pipeline Locally with `act`

```bash
act \
  -P ubuntu-latest=catthehacker/ubuntu:act-latest \
  -s DOCKERHUB_USER=<YOUR_DOCKERHUB_USERNAME> \
  -s DOCKERHUB_TOKEN=<YOUR_DOCKERHUB_ACCESS_TOKEN>
```

Replace `<YOUR_DOCKERHUB_USERNAME>` and `<YOUR_DOCKERHUB_ACCESS_TOKEN>` with your Docker Hub credentials. This will simulate the GitHub Actions workflow on your machine.

## Pulling and Running the Docker Image

After a successful CI/CD run, the image is published to Docker Hub under your registry. To pull and run it:

```bash
docker pull <YOUR_DOCKERHUB_USERNAME>/hello-world:v1.0.0

docker run --rm <YOUR_DOCKERHUB_USERNAME>/hello-world:v1.0.0
```

## Links

* [GitHub Actions Workflow Run](https://github.com/yuvalham/ness_assignment/actions/workflows/ci-cd.yaml)
* [Docker Hub Repository](https://hub.docker.com/r/yuvalham/hello-world)
