name 'cookweb'
maintainer 'Henry Akinola'
maintainer_email 'henry@henry.com'
licence 'Nginx'
description  'Transfers web files in files directory to the server, updates the nginx config'
long_description 'Transfers web files in files directory to the server, updates the nginx config'
version '0.0.2'

supports 'ubuntu'
recipe 'cookweb::web', 'trnsfers web files and updates the nginx config and update nginx config with template file'
