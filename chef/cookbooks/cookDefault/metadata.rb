name 'cookdefault'
maintainer 'Henry Akinola'
maintainer_email 'henry@henry.com'
licence 'Nginx'
description  'Installs default configuration on server'
long_description 'Installs default configuration on server'
version '0.0.3'

supports 'ubuntu'
recipe 'cookdefault::default', 'Installs reuired software on all servers: emacs, tree and user configurations'
