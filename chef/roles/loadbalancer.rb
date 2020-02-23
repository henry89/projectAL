name "webserver"
description "installs all recipes required to for the loadbalancer"
run_list 'recipe[cookDefault::default],recipe[cookNginx::nginx],recipe[cookNginx::loadbalancer]'
