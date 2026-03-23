# TensorFlow RTX 50 Series Support
Docker build of Python wheels for TensorFlow with support for NVIDIA RTX 50 series GPUs.

docker build -t blackwelltfnotebook:cuda12.9-tf2.20BLACKWELL -f Dockerfile-tf2.20 .
docker build -t blackwelltfnotebook:cuda12.9-tf2.20BLACKWELL -f Dockerfile-tf2.21 .
docker build -t blackwelltfnotebook:cuda12.9-tf2.20BLACKWELL -f Dockerfile-tf2.22-beta .
docker build -t blackwelltfnotebook:latest -f Dockerfile-tf2.21 .


## Supported GPU Architectures
Built with CUDA compute capabilities for the following architectures:

- `compute_120`  (RTX 50 series)  
- `compute_89` 
- `compute_86`  
- `compute_75`  
- `compute_61`

## Launch container after building it
docker run --gpus all --ipc=host --ulimit memlock=-1 --ulimit stack=33554432 -itd --memory 32g --name blackwelltfnotebook --restart unless-stopped -p 8888:8888 -e TF_FORCE_GPU_ALLOW_GROWTH=true -e TF_GPU_ALLOCATOR=cuda_malloc_async -e JUPYTER_TOKEN="<Jupyter Token>" blackwelltfnotebook

### 


