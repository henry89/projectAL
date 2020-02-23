name "webserver"
description "installs all recipes required to for webserver"
run_list "recipe[cookdefault::default]", "recipe[cooknginx::nginx]", "recipe[cookweb::web]"
