name             'cookbook_moodle'
maintainer       'Fred Thompson'
maintainer_email 'fred.thompson@buildempire.co.uk'
license          'Apache 2.0'
description      'The Moodle cookbook, a fresh moodle deployment'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.10'

recipe 'cookbook_moodle', 'The Moodle cookbook, a fresh moodle deployment.'

%w{ ubuntu }.each do |os|
  supports os
end

%w{apt build-essential appbox database git htpasswd magic_shell newrelic nodejs nginx php php-fpm rackspace_cloudbackup rackspace_cloudmonitoring xml}.each do |cb|
  depends cb
end