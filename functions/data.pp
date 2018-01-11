function ntp::data() {
  $base_params = {
    'ntp::service_hasrestart'       => true,
    'ntp::service_hasstatus'        => true,
    'ntp::package_name'     => 'ntp',
    'ntp::package_ensure'   => 'present',
    'ntp::config_file_mode' => '0664',
    'ntp::service_ensure'   => 'running',
    'ntp::service_enable'   => true,
    'ntp::ntp_servers'          =>  ['0.centos.pool.ntp.org','1.centos.pool.ntp.org'],
    'ntp::config_name'      => 'ntp.conf',
  }
  $service_name = $facts['os']['family'] ? {
    'Debian'   => 'ntp',
    'default'  => 'ntpd'
  }
 
  $extra_params = {
    'ntp::service_name' => $service_name
  }
  $base_params + $extra_params
}
