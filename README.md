# TensorFlow RTX 50 Series Support

Pre-built Python wheels for TensorFlow with support for NVIDIA RTX 50 series GPUs.

## Supported GPU Architectures

Built with CUDA compute capabilities for the following architectures:

- `compute_120`  (RTX 50 series)  
- `compute_89` 
- `compute_86`  
- `compute_75`  
- `compute_61`

## Build the image

Build the image with Docker build command:
```docker build . -f Dockerfile -t tensorflow-50:latest```

Then get the wheel from the docker image like this to host:
```docker run -it -p 8080:8080 tensorflow-50:latest python3 -m http.server 8080```

## TensorFlow Source

Note, currently `compute_120` support only builds based on the following TensorFlow commit:
[**tensorflow/tensorflow@1f4ee8b**](https://github.com/tensorflow/tensorflow/commit/1f4ee8bcd86b7333e9a98f666d70309fc7c8907a)
