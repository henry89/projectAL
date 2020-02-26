name 'cooknginx'
maintainer 'Henry Akinola'
maintainer_email 'henry@henry.com'
licence 'Nginx'
description  'Installs nginx on server'
long_description 'Installs nginx on server'
vaersion '0.0.2'


supports 'ubuntu'
recipe 'cooknginx::default', 'Installs NGINX'
recipe 'cooknginx::loadbalancer', 'Applies the loadbalancer configuration'
