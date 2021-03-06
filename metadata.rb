name             'devbox'
maintainer       'mauricio silva'
maintainer_email 'mauricio.silva@gmail.com'
license          'All rights reserved'
description      'Installs/Configures devbox'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'


depends 'apt'
depends 'git'
depends 'build-essential'
depends 'nodejs'
depends 'java'
depends 'cassandra'
depends 'php'
