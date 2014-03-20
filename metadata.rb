name             'kibana_auth'
maintainer       'Twiket LTD'
maintainer_email 'dennybaa@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures chef-kibana_auth'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

depends 'kibana'
depends 'runit'
