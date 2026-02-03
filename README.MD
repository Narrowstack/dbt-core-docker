# DBT Core Docker Images

This is a collection of docker images useful for development with things like VS Code Dev Containers but also as a suitable base for production images of dockerized DBT projects.

## Image Tags

Currently supported images are:

```
#base image
ghcr.io/narrowstack/dbt-core-docker/base:latest
ghcr.io/narrowstack/dbt-core-docker/base:3.14.2

# postgres
ghcr.io/narrowstack/dbt-core-docker/postgres:1.11.2-1.10.0

#snowflake
ghcr.io/narrowstack/dbt-core-docker/snowflake:1.9.4-1.9.4
ghcr.io/narrowstack/dbt-core-docker/snowflake:1.11.2-1.11.1

#clickhouse
ghcr.io/narrowstack/dbt-core-docker/clickhouse:1.10.9-1.9.2
ghcr.io/narrowstack/dbt-core-docker/clickhouse:1.11.2-1.9.8
```

### Base Image

The base image only contains a prepped python base to easily build adapter images from by essentially just including what pypi packages to install.

### DBT Core & Adapter Versions

The tagging will follow this naming convention: `dbt-core-docker/{adapter-type}:{core-version}-{adapter-version}` for example `dbt-core-docker/postgres:1.11.2-1.10.0`.

## Note on updates and CVEs

The base image is based on `python:3.14.2-slim` which has a [critical CVE for openssl](https://hub.docker.com/layers/library/python/3.14.2-slim-trixie/images/sha256-d3dc90fda94a9325de371096fab40325637a6847561d58efae783ac98f8169c3). The image updates the openssl version to the fix version `3.5.4-1~deb13u2`. You can verify this by running

```
docker run --rm ghcr.io/Narrowstack/dbt-core-docker/base:latest bash -c 'dpkg -l | grep openssl'
```

## Scanning For Vulnerabilities

We use trivy to scan images for vulnerabilities and fix where possible. However nothing is perfect, so please always run this scan yourself and determine if the risk is acceptable to your use-case.

To list all High & Critical CVEs run

```
docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    aquasec/trivy image --severity HIGH,CRITICAL \
    ghcr.io/Narrowstack/dbt-core-docker/base:latest > scan_results
```

Or just fixable CRITICAL ones"

```
docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    aquasec/trivy image --severity HIGH,CRITICAL \
    ghcr.io/Narrowstack/dbt-core-docker/base:latest > scan_fixable
```
