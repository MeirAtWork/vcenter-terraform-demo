terraform apply                                                    ^
  -var "private_cloud_login=xxx@QUALISYSTEMS.LOCAL"                ^
  -var "private_cloud_password=xxx"                                ^
  -var "private_cloud_host=192.168.42.110"                         ^
  -var "datacenter_name=Sandbox vCenter"                           ^
  -var "datastore_name=SB-DS2"                                     ^
  -var "resource_pool_name=testing"                                ^
  -var "compute_cluster_name=Sandbox Cluster"                      ^
  -var "network_name=myPortGroup"                                  ^
  -var "virtual_machine_template_name=Ubuntu 18.04 Clean"          ^
  -var "virtual_machine_name=aaa"                                  ^
  -var "virtual_machine_folder=Meir.b/testingVcenter"

pause
