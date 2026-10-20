#!/bin/bash

### to test

function create_user_accounts()
{
  local flag=
  local line=
  while read -r line; do
    local IFS=":"
    local line=($line)
    local netID=${line[0]}
    local uID=${line[2]}
    local gID=${line[3]}
    local name=${line[4]}

    if [[ -d /home/${netID} ]]; then flag="-M"; fi

    /usr/sbin/groupadd -g ${gID} ${netID}
    /usr/sbin/useradd ${flag} -g ${gID} -s /bin/bash -u ${uID} -c "${name}" ${netID}
  done <<EOF
sw77:x:1296493:1296493:Shenglong Wang:/home/sw77:/bin/bash
am16362:x:4639534:4639534:Akhil Vardhan Mallipeddu:/home/am16362:/bin/bash
tc1841:x:2420783:2420783:Taidi Chen:/home/tc1841:/bin/bash
tc4119:x:4284622:4284622:Robin Chen:/home/tc4119:/bin/bash
tjk8841:x:4015130:4015130:Thomas Kim:/home/tjk8841:/bin/bash
wd35:x:2761180:2761180:Wensheng Deng:/home/wd35:/bin/bash
EOF

  unset IFS
}

(
  echo "Hello world" 
  hostname
  env | sort -u
  create_user_accounts
) >> /tmp/nyu-startup.log 2>&1

