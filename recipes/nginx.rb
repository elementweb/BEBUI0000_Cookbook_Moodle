#
# Cookbook Name:: cookbook_moodle
# Recipe:: nginx
#
# Install Nginx from source to support custom Nginx modules in future.
#

::Chef::Recipe.send(:include, PHPBox::Helpers)

# Set the initialisation style for nginx
node.set['nginx']['init_style'] = "init"

# Install nginx from source
include_recipe "nginx::source"

# Setup the nginx site configuration
app = {}
app['appname'] = node['cookbook_moodle']['appname']
app['hostname'] = node['cookbook_moodle']['hostname']
app['nginx_config'] = {}
app['nginx_config']['listen_port'] = node['cookbook_moodle']['listen_port']
app['nginx_config']['redirects'] = node['cookbook_moodle']['redirects']
app_dir = ::File.join(node['appbox']['apps_dir'], app['appname'])
setup_nginx_site(app, app_dir)