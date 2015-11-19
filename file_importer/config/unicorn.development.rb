# Ansible managed: /home/mau/Code/setup/file_importer/file_importer/railsbox/ansible/roles/unicorn/templates/unicorn.rb.j2 modified on 2015-11-19 00:39:12 by mau on localhost.localdomain

working_directory '/file_importer/file_importer/file_importer'

pid '/file_importer/file_importer/file_importer/tmp/unicorn.development.pid'

stderr_path '/file_importer/file_importer/file_importer/log/unicorn.err.log'
stdout_path '/file_importer/file_importer/file_importer/log/unicorn.log'

listen '/tmp/unicorn.development.sock'

worker_processes 2

timeout 30
