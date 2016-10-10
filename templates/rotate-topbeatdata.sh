#!/bin/bash
for d in `find /var/lib/elasticsearch/openstack_elk/nodes/0/indices/ -maxdepth 1 -type d -mtime +4 | grep -E 'topbeat|filebeat'`;
do
  echo $d
  tar -zcvf $d.tar.gz $d && rm -r $d
  mv $d.tar.gz /var/lib/elasticsearch-olddata/;
done
