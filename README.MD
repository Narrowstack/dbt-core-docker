# DBT Core Docker Images

This is a collection of docker images useful for development with things like VS Code Dev Containers but also as a suitable base for production images of dockerized DBT projects.

## Image Tags

### Base Image

There is also the base python images without the dbt-core or dbt-{{adapter}} images installed available as at tag `3.14.2-base` and `latest`.

### DBT Core & Adapter Versions

The tagging will follow this naming convention: `{core-version}-{adapter-type}-{adapter-version}` for example `1.11.2-postgres-1.10.0`.

## Note on updates and CVEs

The base image is based on `python:3.14.2-slim` which has a [critical CVE for openssl](https://hub.docker.com/layers/library/python/3.14.2-slim-trixie/images/sha256-d3dc90fda94a9325de371096fab40325637a6847561d58efae783ac98f8169c3). The image updates the openssl version to the fix version `3.5.4-1~deb13u2`. You can verify this by running

```
docker run --rm ghcr.io/Narrowstack/dbt-core-docker:latest bash -c 'dpkg -l | grep openssl'
```

## Scanning For Vulnerabilities

We use trivy to scan images for vulnerabilities and fix where possible. However nothing is perfect, so please always run this scan yourself and determine if the risk is acceptable to your use-case.

To list all High & Critical CVEs run

```
docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    aquasec/trivy image --severity HIGH,CRITICAL \
    ghcr.io/Narrowstack/dbt-core-docker:latest > scan_results
```

Or just fixable CRITICAL ones"

```
docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    aquasec/trivy image --severity HIGH,CRITICAL \
    ghcr.io/Narrowstack/dbt-core-docker:latest > scan_fixable
```
