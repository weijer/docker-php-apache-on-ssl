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
docker build -t docker-php-apache-on-ssl:5.6-solid ./5/5.6-solid
```

### run container

```bash
docker run --rm -v $PWD:/root/app --rm docker-php-apache-on-ssl:5.6-solid
```

## Use Dockerhub image

```bash
docker pull blackellis/docker-php-apache-on-ssl:5.6-solid
docker run --rm -v $PWD:/var/www/html blackellis/docker-php-apache-on-ssl:5.6-solid
```
