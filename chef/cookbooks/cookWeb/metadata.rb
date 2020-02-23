name cookNginx
maintainer 'Henry Akinola'
maintainer_email 'henry@henry.com'
licence 'Nginx'
description  'Transfers web files in files directory to the server, updates the nginx config'
long_description IO.read(FILE.join(FILE.dirname(__FILE__), 'README.md'))
version 0.0.1

depends 'nginx'

supports 'ubuntu'
recipe 'cookWeb::web', 'trnsfers web files and updates the nginx config'