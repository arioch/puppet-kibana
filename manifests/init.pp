# = Class: kibana
#
class kibana (
  $pkg_deps   = $::kibana::params::pkg_deps,
  $pkg_ensure = $::kibana::params::pkg_ensure,
  $pkg_list   = $::kibana::params::pkg_list,
) inherits kibana::params {
  class { 'kibana::install': } ->
  Class['kibana']
}

