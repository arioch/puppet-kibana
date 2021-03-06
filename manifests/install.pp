# == Class kibana::install
#
class kibana::install {
  package { $::kibana::pkg_list:
    ensure => $::kibana::pkg_ensure,
  }

  if $::kibana::pkg_deps {
    package { $::kibana::pkg_deps:
      ensure => $::kibana::pkg_ensure,
      before => Package[$::kibana::pkg_list],
    }
  }

  if $::kibana::pkg_deps_gem {
    package { $::kibana::pkg_deps_gem:
      ensure   => $::kibana::pkg_ensure,
      before   => Package[$::kibana::pkg_list],
      provider => 'gem',
    }
  }
}

