terraform plan                                                    ^
  -var "private_cloud_login=buser@QUALISYSTEMS.LOCAL"              ^
  -var "private_cloud_password=qaz$9512"                           ^
  -var "private_cloud_host=Vcenter5.qualisystems.local"            ^
  -var "datacenter_name=Qualisystems"                              ^
  -var "esxi_host=192.168.42.237"                                  ^
  -var "virtual_switch_name=vSwitch5"                              ^
  -var "port_group_name=myPortGroup"                               ^
  -var "vlan_id=65"                                                ^
  -out=c:\temp\vlanPlan.bin

terraform show -json c:\temp\vlanPlan.bin > c:\temp\vlanPlan.json

pause
