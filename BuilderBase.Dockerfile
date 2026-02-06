FROM python:3.13-slim
RUN groupadd -g 1000 dbt \
    && useradd -u 1000 -g dbt -s /bin/sh -m dbt \
    && echo "dbt:dbt" | chpasswd
ENV DEBIAN_FRONTEND=noninteractive
ENV PATH=/home/dbt/.local/bin:$PATH
ENV PS1="\[\033[01;34m\]\w\[\033[00m\]\$ \[\]"
RUN apt update && apt install -y gcc git curl locales openssl tar && sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=en_US.UTF-8
RUN usermod -s /bin/bash dbt
WORKDIR /workspaces
USER dbt
RUN curl https://raw.githubusercontent.com/fishtown-analytics/dbt-completion.bash/master/dbt-completion.bash > ~/.dbt-completion.bash \
    && echo 'source ~/.dbt-completion.bash' >> ~/.bashrc