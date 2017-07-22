#!/bin/vbash

if [ "$(id -g -n)" != 'vyattacfg' ] ; then
  exec sg vyattacfg -c "/bin/vbash $(readlink -f $0) $@"
fi

source /opt/vyatta/etc/functions/script-template

set protocols bgp 65537 neighbor 10.0.1.11 ebgp-multihop 2 
set protocols bgp 65537 neighbor 10.0.1.11 remote-as 65536 
set protocols bgp 65537 neighbor 10.0.1.11 update-source 10.0.1.12
set protocols bgp 65537 neighbor 10.0.1.11 advertisement-interval 1
set protocols bgp 65537 network 10.0.3.0/24
set protocols bgp 65537 parameters router-id 10.0.1.12

commit
save
