# docker-flexgen
flexgen in docker

## requirements
- [cuda-drivers](https://developer.nvidia.com/cuda-downloads)
- [nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)

## run bench

```
$ docker build . -t flexgen
$ docker run --rm --gpus all flexgen
```