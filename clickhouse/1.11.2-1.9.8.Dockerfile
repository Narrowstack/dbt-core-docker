FROM ghcr.io/narrowstack/dbt-core-docker/base:3.14.2-base
RUN pip install dbt-core==1.11.2 dbt-clickhouse==1.9.8