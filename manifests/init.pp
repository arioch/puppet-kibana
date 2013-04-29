# = Class: kibana
#
class kibana (
  $log_dir     = $::kibana::params::log_dir,
  $pkg_deps    = $::kibana::params::pkg_deps,
  $pkg_ensure  = $::kibana::params::pkg_ensure,
  $pkg_list    = $::kibana::params::pkg_list,
  $server_name = $::kibana::params::server_name,
) inherits kibana::params {
  class { 'kibana::install': } ->
  class { 'kibana::config': } ->
  Class['kibana']
}

