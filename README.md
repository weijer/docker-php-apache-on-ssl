# docker-php-apache-on-ssl


<!-- @import "[TOC]" {cmd="toc" depthFrom=2 depthTo=6 orderedList=false} -->
<!-- code_chunk_output -->

* [use base container](#use-base-container)
* [Usage](#usage)
	* [run container](#run-container)
* [Use Dockerhub image](#use-dockerhub-image)

<!-- /code_chunk_output -->


## use base container

- [php](https://hub.docker.com/_/php)

## Usage

### run container

```bash
docker run --rm -v $PWD:/root/app --rm docker-php-apache-on-ssl:<version>
```

## Use Dockerhub image

```bash
docker pull blackellis/docker-php-apache-on-ssl:<version>
docker run --rm -v $PWD:/var/www/html blackellis/docker-php-apache-on-ssl:<version>
```
