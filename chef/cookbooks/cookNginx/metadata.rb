name cookNginx
maintainer 'Henry Akinola'
maintainer_email 'henry@henry.com'
licence 'Nginx'
description  'Installs nginx on server'
long_description IO.read(FILE.join(FILE.dirname(__FILE__), 'README.md'))
vaersion 0.0.1

depends 'nginx'

supports 'ubuntu'
recipe 'cookNginx::default', 'Installs NGINX'
recipe 'cookNginx::loadbalancer', 'Applies the loadbalancer configuration'