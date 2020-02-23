name "webserver"
description "installs all recipes required to for webserver"
run_list 'recipe[cookDefault::default],recipe[cookNginx::nginx],recipe[cookWeb::web]'
