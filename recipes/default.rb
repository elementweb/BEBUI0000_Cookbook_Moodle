#
# Cookbook Name:: cookbook_moodle
# Recipe:: default
#

moodle_app = {}
moodle_app['appname'] = node['cookbook_moodle']['appname']
moodle_app['hostname'] = node['cookbook_moodle']['hostname']
moodle_app['nginx_config'] = {
  'template_name' => 'nginx_vhost_moodle.conf.erb',
  'template_cookbook' => 'cookbook_phpbox'
}


node.set['cookbook_phpbox']['webserver'] = 'nginx'
node.set['cookbook_phpbox']['apps'] = [moodle_app]

# Set the php initialisation options
node.set['php']['directives'] = {
    'date.timezone' => 'Europe/London',
    'short_open_tag' => 'Off',
    'magic_quotes_gpc' => 'Off',
    'register_globals' => 'Off',
    'session.autostart' => 'Off',
    'upload_max_filesize' => '25M',
    'post_max_size' => '25M',
    'max_execution_time' => '600',
    'opcache.enable' => '1',
    'oci8.statement_cache_size' => 0
}

node.set['php-fpm']['pools'] = [
  {
    :name => "www",
    :listen => "127.0.0.1:9001"
  }
]

include_recipe "git"
if node['cookbook_moodle']['database']['type'] == 'oracle'
  include_recipe "cookbook_moodle::oracle"
end
include_recipe "cookbook_phpbox"
include_recipe "cookbook_moodle::users"

if node['cookbook_moodle']['database']['type'] != 'oracle'
  include_recipe "cookbook_moodle::php"
end

if node['cookbook_moodle']['database']['type'] == 'mysql'
  include_recipe "cookbook_moodle::mysql"
end
include_recipe "cookbook_moodle::moodle"