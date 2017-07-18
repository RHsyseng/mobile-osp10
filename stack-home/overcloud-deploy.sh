openstack overcloud deploy \
--templates  \
-e /home/stack/templates/network-isolation.yaml \
-e /home/stack/templates/network-environment.yaml \
-e /home/stack/templates/storage-environment.yaml \
-e /home/stack/templates/ips-from-pool-all.yaml \
-e /usr/share/openstack-tripleo-heat-templates/environments/neutron-ovs-dpdk.yaml \
-e /home/stack/templates/neutron-sriov.yaml \
-r /home/stack/templates/roles_data.yaml
