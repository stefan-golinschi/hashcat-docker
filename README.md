# hashcat-docker

Hashcat built using nvidia docker container.

## Prepare container

```
docker build -t hashcat:cuda12 .
```

## Test nvidia-smi

```bash
docker run -it --rm --gpus all hashcat:cuda12
nvidia-smi
```
