FROM ghcr.io/narrowstack/dbt-core-docker/base:3.14.2-base
USER root
RUN apt update && apt install -y build-essential libssl-dev libffi-dev
USER dbt
RUN pip install dbt-core==1.11.2 dbt-snowflake==1.11.1