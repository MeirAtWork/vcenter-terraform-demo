terraform apply                                                    ^
  -var "private_cloud_login=buser@QUALISYSTEMS.LOCAL"              ^
  -var "private_cloud_password=qaz$9512"                           ^
  -var "private_cloud_host=Vcenter5.qualisystems.local"            ^
  -var "datacenter_name=Qualisystems"                              ^
  -var "datastore_name=DATASTORE HOST1"                            ^
  -var "resource_pool_name=testing"                                ^
  -var "network_name=myPortGroup"                                  ^
  -var "virtual_machine_template_name=CentOs79Template"            ^
  -var "virtual_machine_name=aaa"                                  ^
  -var "virtual_machine_folder=testingVcenter"

pause
