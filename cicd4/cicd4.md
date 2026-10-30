 # GHCR
ghcr.io/raznulasri/ship-dashboard:latest

# self-hosted runner
ip-10-0-2-184

# auto-deploy
name: containerize

on: [push]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v7
      - uses: actions/setup-node@v7
      - run: npm clean-install
      - run: npm run test

  build-push:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v7
      - uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.repository_owner }}
          password: ${{ secrets.GITHUB_TOKEN }}
      - uses: docker/build-push-action@v7
        with:
          context: .
          push: true
          tags: ghcr.io/${{ github.repository }}:latest

  deploy:
    needs: build-push
    runs-on: self-hosted
    steps:
      - uses: actions/checkout@v7
      - run: docker compose up -d --pull always

permissions:
  packages: write
  contents: read