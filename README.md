# MongoDB on Vagrant CentOS7

- one setting need be change in Vagrantfile
  - `config.vm.synced_folder "/home/yangsun1/workspace/dashboard/lwp/dashboard/data", "/mongodb/data"`
  - replace dir `/home/yangsun1/workspace/dashboard/lwp/dashboard/data` with your own mongodb data.
- init_data.sh is for seeding date and create an admin user
