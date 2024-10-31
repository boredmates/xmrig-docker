# XMRig-Docker

Docker containing latest XMRig version

Download:<br/>
https://boredmates.de/xmrig-docker<br/>
https://hub.docker.com/r/boredmates/xmrig-docker

XMRig is a cryptocurrency miner with CPU and AMD & NVIDIA GPU support.

With this image, you can launch XMRig with dynamic coin switching (depending on pool) in a Docker or Podman container. The container can easily run on your local computer using standard Docker commands or in a Kubernetes environment.
It allows you to mine locally for a pool and receive different cryptocurrency coins for your efforts.

We are not the developers of XMRig, just provide this dockerized image of it, credits go to the great work from XMRig and all contributors.

## Getting Started

It's really very easy to use this Docker image. After installing Docker itself, simply follow these steps.

Pull this Docker image:

```bash
docker pull boredmates/xmrig-docker
```

Start mining:

```bash
docker run --rm -it --name=my-xmrig boredmates/xmrig-docker
```

Give it a try and you should see a container starting and firing up mining to a pool.
With this basic configuration, without any options, you will mine for us (three nice guys), which is a way to support our efforts. Consider letting it run for an hour or a day ;) We will keep this image up to date with changes to XMRig.

## Stopping container

Press `CTRL+C` to stop the container, and it will be automatically removed. Alternatively, control your containers with Docker Desktop: https://www.docker.com/products/docker-desktop/

## Custom Configuration

```bash
docker run --rm -it --name=my-xmrig boredmates/xmrig-docker
--url=xkr.pool-pay.com:5388 \
--user=SEKReT2py3HLKr8eQV9CFjBpLrJ4s6N2VMzkkwJPd6rfJj7rDTEXaR8azu8ADQcR93BHFLpcjHvCNSSXBBi1pZTqKYNv2KUyFLX \
--pass=x \
--cpu-priority=4 \
--threads=2
```

These basic parameters should be self-explanatory, but for a reference:

| **Parameter** | **Description** | **Example value** |
|---|---|---|
| --url | URL and the port of the pool you want to use, most pools have a Getting Started page with this information. | xkr.pool-pay.com:5388 |
| --user | Wallet address you want to mine to at the pool. | SEKReT2py3HLKr8eQV9CFjBpLrJ4s6N2VMzkkwJPd6rfJj7rDTEXaR8azu8ADQcR93BHFLpcjHvCNSSXBBi1pZTqKYNv2KUyFLX |
| --pass | Password, or at some pools used as the worker name for the pool dashboard | x |
| --cpu-priority |  Number between 1 (idle) and 5 (highest) of the CPU process priority, default is 2  | 4 |
| --threads |  Number of threads to use on the CPU | 2 |

The compact version of the same is:
```bash
docker run --rm -it --name=my-xmrig boredmates/xmrig-docker -o xkr.pool-pay.com:5388 -u SEKReT2py3HLKr8eQV9CFjBpLrJ4s6N2VMzkkwJPd6rfJj7rDTEXaR8azu8ADQcR93BHFLpcjHvCNSSXBBi1pZTqKYNv2KUyFLX -p x --cpu-priority=4 --threads=2
```

We recommend taking a look at XRMig website itself, it has all relevant information about parameters and algorithms:<br/>
https://xmrig.com/docs/miner/command-line-options<br/>
https://xmrig.com/docs/algorithms

If you have questions or want to let us know if something is not working, feel free to reach out to us at info@boredmates.com
