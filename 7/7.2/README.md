# docker-php-apache-on-ssl


<!-- @import "[TOC]" {cmd="toc" depthFrom=2 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [use base container](#use-base-container)
* [Usage](#usage)
	* [build](#build)
	* [run container](#run-container)
* [Use Dockerhub image](#use-dockerhub-image)

<!-- /code_chunk_output -->


## use base container

- [php](https://hub.docker.com/_/php)

## Usage

### build

```bash
docker build -t docker-php-apache-on-ssl:7.1 ./7/7.1
```

### run container

```bash
docker run --rm -v $PWD:/var/www/html docker-php-apache-on-ssl:7.1
```

## Use Dockerhub image

```bash
docker pull blackellis/docker-php-apache-on-ssl:7.1
docker run --rm -v $PWD:/var/www/html blackellis/docker-php-apache-on-ssl:7.1
```
