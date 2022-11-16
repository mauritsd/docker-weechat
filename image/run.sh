#!/bin/bash

set -e

[[ -z $NO_AUTOSTART ]] && su - maurits -c "tmux new -d -s weechat weechat"

mkdir /home/maurits/.ssh/
[[ -n $SSH_PUBKEY ]] && echo $SSH_PUBKEY > /home/maurits/.ssh/authorized_keys
chown maurits:maurits -R /home/maurits/

exec /usr/sbin/sshd -D