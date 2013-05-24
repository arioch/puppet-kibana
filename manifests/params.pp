# == Class: kibana::params
#
class kibana::params {
  $server_name = "kibana.${::fqdn}"

  case $::operatingsystem {
    'RedHat': {
      $pkg_deps   = undef
      $pkg_ensure = present
      $pkg_list   = 'kibana'
    }

    'Debian': {
      case $::lsbdistcodename {
        'wheezy': {
          $log_dir      = '/var/log/apache2'
          $pkg_deps     = [ 'ruby-tzinfo', 'ruby-sinatra', 'ruby-fastercsv' ]
          $pkg_deps_gem = undef
          $pkg_ensure   = present
          $pkg_list     = 'kibana'
        }

        'squeeze': {
          $log_dir      = '/var/log/apache2'
          $pkg_deps     = [ 'libtzinfo-ruby', 'libsinatra-ruby' ]
          $pkg_deps_gem = 'fastercsv'
          $pkg_ensure   = present
          $pkg_list     = 'kibana'
        }

        default: {
          fail "Debian ${::lsbdistcodename} is not supported."
        }
      }
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported."
    }
  }
}

