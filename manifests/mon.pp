class cephdeploy::mon(
){

  include cephdeploy

  exec { 'create mon':
    command => "/usr/local/bin/ceph-deploy create mon $::hostname",
    cwd     => '/etc/ceph/bootstrap',
    unless  => '/bin/ps -ef | /bin/grep -v grep | /bin/grep ceph-mon',
    require => [ Exec['get ceph-deploy'], File['ceph.mon.keyring'] ],
  }


}
