docker build -t blackwellnotebook:cuda12.9-tf2.20RTX -f Dockerfile-cuda12.9-tf2.20 .
docker build -t blackwellnotebook:cuda12.9-tf2.21RTX -f Dockerfile-cuda12.9-tf2.21 .
docker build -t blackwellnotebook:latest -f Dockerfile-cuda12.9-tf2.21 .
