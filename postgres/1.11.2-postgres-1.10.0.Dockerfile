FROM ghcr.io/narrowstack/dbt-core-docker/base:3.14.2-base
RUN pip install dbt-core==1.11.2 dbt-postgres==1.10.0