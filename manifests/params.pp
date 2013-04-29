# = Class: kibana::params
#
class kibana::params {
  case $::operatingsystem {
    'RedHat': {
      $pkg_deps   = undef
      $pkg_ensure = present
      $pkg_list   = 'kibana'
    }

    'Debian': {
      case $::lsbdistcodename {
        'wheezy': {
          $pkg_deps     = [ 'ruby-tzinfo', 'ruby-sinatra', 'ruby-fastercsv' ]
          $pkg_deps_gem = undef
          $pkg_ensure   = present
          $pkg_list     = 'kibana'
        }

        'squeeze': {
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

