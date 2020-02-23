name cookNginx
maintainer 'Henry Akinola'
maintainer_email 'henry@henry.com'
licence 'Nginx'
description  'Installs default configuration on server'
long_description IO.read(FILE.join(FILE.dirname(__FILE__), 'README.md'))
version 0.0.1

depends 'nginx'

supports 'ubuntu'
recipe 'cookDefault::default', 'Installs reuired software on all servers: ntp, vim and user configurations'