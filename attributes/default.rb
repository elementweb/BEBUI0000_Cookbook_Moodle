default['cookbook_moodle']['appname'] = 'moodle'
default['cookbook_moodle']['hostname'] = 'localhost'
default['cookbook_moodle']['listen_port'] = '80'
default['cookbook_moodle']['user'] = 'www-data'
default['cookbook_moodle']['group'] = 'www-data'
default['cookbook_moodle']['address'] = 'http://localhost'
default['cookbook_moodle']['generate_config'] = false

default['cookbook_moodle']['database']['type'] = 'mysql'
default['cookbook_moodle']['database']['host'] = '127.0.0.1'
default['cookbook_moodle']['database']['root_password'] = nil
default['cookbook_moodle']['database']['database_name'] = 'moodle'
default['cookbook_moodle']['database']['username'] = 'moodle'
default['cookbook_moodle']['database']['password'] = ''

default["cookbook_moodle"]["mysql_version"] = "5.6"

default["cookbook_moodle"]["default_config"]["nginx"]["template_name"] = "nginx_vhost.conf.erb"
default["cookbook_moodle"]["default_config"]["nginx"]["template_cookbook"] = "cookbook_moodle"
default["cookbook_moodle"]["default_config"]["nginx"]["listen_port"] = "80"

default["cookbook_moodle"]["redirects"] = []
default['cookbook_moodle']['cronic'] = '/opt/bin/cronic'
default['cookbook_moodle']['cron_hour'] = "*"
default['cookbook_moodle']['cron_minute'] = "*/5"

default['cookbook_moodle']['nodejs']['version'] = '0.12.4'
default['cookbook_moodle']['nodejs']['checksum'] = '3298d0997613a04ac64343e8316da134d04588132554ae402eb344e3369ec912'

default['cookbook_moodle']['php_packages'] = []
default['cookbook_moodle']['php_pears'] = []
default['cookbook_moodle']['npm_packages'] = []

default['cookbook_moodle']['mysql']['max_allowed_packet'] = '128M'

default['cookbook_moodle']['htpasswd']['username'] = ''
default['cookbook_moodle']['htpasswd']['password'] = ''
default['cookbook_moodle']['htpasswd']['path'] = ''

default['cookbook_moodle']['newrelic']['license_key'] = nil

default['build-essential']['compile_time'] = true

