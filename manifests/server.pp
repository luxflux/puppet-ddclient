class ddclient::server {

  package { ["ddclient"]:
    ensure => installed
  }

  file { "/etc/ddclient.conf":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 600,
    content => template("ddclient/ddclient.conf.erb"),
    require => Package["ddclient"];
  }

  service { "ddclient":
    ensure      => running,
    subscribe   => File["/etc/ddclient.conf"],
    require     => Package["ddclient"];
  }

}
