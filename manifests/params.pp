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
      $pkg_deps     = [ 'libtzinfo-ruby', 'libsinatra-ruby' ]
      $pkg_ensure   = present
      $pkg_list     = 'kibana'
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported yet."
    }
  }
}

