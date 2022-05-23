docker buildx build --platform linux/amd64 -t repo.minenbauer.de/htobi02/xteve:latest -f Dockerfile --push .
docker buildx build --platform linux/amd64 -t repo.minenbauer.de/htobi02/xteve:debian -f Dockerfile.debian --push .
docker buildx build --platform linux/amd64 -t repo.minenbauer.de/htobi02/xteve:ubuntu -f Dockerfile.ubuntu --push .
docker buildx build --platform linux/amd64 -t repo.minenbauer.de/htobi02/xteve:nvidia -f Dockerfile.nvidia --push .
