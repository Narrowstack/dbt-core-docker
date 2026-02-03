FROM ghcr.io/narrowstack/dbt-core-docker/base:3.14.2-base
RUN pip install dbt-core==1.10.9 dbt-clickhouse==1.9.2