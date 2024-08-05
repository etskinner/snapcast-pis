#!/bin/bash

cat <<EOF > /etc/snapserver.conf
[server]

[http]
doc_root = /usr/share/snapserver/snapweb

[tcp]

[stream]
source = librespot:///usr/bin/librespot?name=music

[streaming_client]

[logging]

EOF

cat <<EOF > /etc/default/snapserver
START_SNAPSERVER=true
SNAPSERVER_OPTS="-c /etc/snapserver.conf"

EOF

systemctl disable raspotify
systemctl stop raspotify
systemctl restart snapserver