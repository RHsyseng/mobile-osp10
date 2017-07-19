neutron net-create --provider:network_type vlan --provider:physical_network fastpath --provider:segmentation_id 4072 sriov1
net_id=$(neutron net-list | grep sriov1 | awk '{print $2}')
neutron subnet-create $net_id --allocation_pool start=172.21.0.2,end=172.21.1.0 --name sriov1-sub 172.21.0.0/16
sub_id=$(neutron subnet-list | grep sriov1-sub | awk '{print $2}')
neutron port-create --name sriov1-port --fixed-ip subnet_id=$sub_id,ip_address=172.21.0.10 --vnic-type direct $net_id

#neutron net-create --provider:network_type vlan --provider:physical_network fastpath --provider:segmentation_id 4073 sriov2
#net_id=$(neutron net-list | grep sriov2 | awk '{print $2}')
#neutron subnet-create $net_id --allocation_pool start=172.22.0.2,end=172.22.1.0 --name sriov2-sub 172.22.0.0/16
#sub_id=$(neutron subnet-list | grep sriov2-sub | awk '{print $2}')
#neutron port-create --name sriov2-port --fixed-ip subnet_id=$sub_id,ip_address=172.22.0.10 --vnic-type direct $net_id

net_id=$(neutron net-list | grep sriov1 | awk '{print $2}')
sub_id=$(neutron subnet-list | grep sriov1-sub | awk '{print $2}')
neutron port-create --name sriov3-port --fixed-ip subnet_id=$sub_id,ip_address=172.21.0.11 --vnic-type direct $net_id

#net_id=$(neutron net-list | grep sriov2 | awk '{print $2}')
#sub_id=$(neutron subnet-list | grep sriov2-sub | awk '{print $2}')
#neutron port-create --name sriov4-port --fixed-ip subnet_id=$sub_id,ip_address=172.22.0.11 --vnic-type direct $net_id

neutron net-create --provider:network_type vlan --provider:physical_network fastpath --provider:segmentation_id 4075 sriov-for-bonds
net_id=$(neutron net-list | grep sriov-for-bonds | awk '{print $2}')
neutron subnet-create $net_id --allocation_pool start=172.30.0.2,end=172.30.1.0 --name sriov-for-bonds-sub 172.30.0.0/16
sub_id=$(neutron subnet-list | grep sriov-for-bonds-sub | awk '{print $2}')
neutron port-create --name sriov-bonded-port --fixed-ip subnet_id=$sub_id,ip_address=172.30.0.10 --vnic-type direct $net_id
neutron port-create --name sriov-bonded-port3 --fixed-ip subnet_id=$sub_id,ip_address=172.30.0.12 --vnic-type direct $net_id

#neutron net-create --provider:network_type vlan --provider:physical_network fastpath --provider:segmentation_id 4076 sriov-for-bonds2
#net_id=$(neutron net-list | grep sriov-for-bonds2 | awk '{print $2}')
#neutron subnet-create $net_id --allocation_pool start=172.30.0.2,end=172.30.1.0 --name sriov-for-bonds-sub2 172.30.0.0/16
#sub_id=$(neutron subnet-list | grep sriov-for-bonds-sub2 | awk '{print $2}')
#neutron port-create --name sriov-bonded-port2 --fixed-ip subnet_id=$sub_id,ip_address=172.30.0.11 --vnic-type direct $net_id
#neutron port-create --name sriov-bonded-port4 --fixed-ip subnet_id=$sub_id,ip_address=172.30.0.13 --vnic-type direct $net_id

openstack router create router1
neutron router-gateway-set router1 public
neutron router-interface-add router1 sriov1-sub

