FROM ubuntu:20.04

ENV LANG C.UTF-8

RUN apt-get update &&\
    apt-get install -y software-properties-common &&\
    add-apt-repository universe &&\
    DEBIAN_FRONTEND=noninteractive apt-get install -y weechat openssh-server language-pack-en tmux mosh tzdata

ENV TZ=Europe/Amsterdam
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN dpkg-reconfigure --frontend noninteractive tzdata

COPY run.sh /run.sh
RUN chmod +x /*.sh

RUN mkdir -p /var/run/sshd &&\
    sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config &&\
    useradd -ms /bin/bash maurits &&\
    echo "set -g status off" >> /home/maurits/.tmux.conf &&\
    echo "tmux a -t weechat" >> /home/maurits/.bashrc &&\
    echo 'export LC_ALL=en_US.UTF-8' >> /home/maurits/.profile &&\
    echo 'export LANG=en_US.UTF-8' >> /home/maurits/.profile

COPY --chown=maurits:maurits dotweechat /home/maurits/.weechat

VOLUME ["/home/maurits/irclogs"]
EXPOSE 22 9000 32016/udp

ENTRYPOINT ["/run.sh"]