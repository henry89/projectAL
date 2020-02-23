name "webserver"
description "installs all recipes required to for the loadbalancer"
run_list 'recipe[cookdefault::default]','recipe[cooknginx::nginx]','recipe[cooknginx::loadbalancer]'
