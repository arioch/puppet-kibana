# = Class kibana::config
#
class kibana::config {
  file { '/usr/share/kibana/apache2.conf':
    ensure  => present,
    content => template('kibana/apache2.conf.erb'),
  }
}

