class ddclient::server {

  package { ["ddclient"]:
    ensure => installed
  }

  file { "/etc/ddclient.conf":
    ensure => present,
    owner => root,
    group => root,
    mode => 600,
    content => template("ddclient/ddclient.conf.erb"),
  }

  service { "ddclient":
    ensure      => running,
    subscribe   => File["/etc/ddclient.conf"],
    require     => File["/etc/default/ddclient"];
  }

  file { "/etc/default/ddclient":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 644,
    content => "run_daemon=true\n";
  }
}