name 'chef_centos7_base'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'all_rights'
description 'Installs/Configures chef_centos7_base'
long_description 'Installs/Configures chef_centos7_base'
version '0.1.0'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/chef_centos7_base/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/chef_centos7_base' if respond_to?(:source_url)
depends 'firewalld'
depends 'postfix'