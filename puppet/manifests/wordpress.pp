class { 'apache':
    port    => 8080,
    template => 'apache/httpd.conf.erb',
}

apache::vhost { 'wp.example.com':
    docroot             => '/var/www/html/wordpress',
    server_name         => 'wp.example.com',
    port                => 8080,
    priority            => '',
    template            => 'apache/virtualhost/vhost.conf.erb',
}

package { 'package':
     provider   => 'rpm',
     ensure     => installed,
     source     => "http://download.ispsystem.com/repo/centos/release/6/x86_64/mod_rpaf-0.8.2-1.el6.x86_64.rpm",
     require    => Class['apache']
}

class { 'php': }

php::module { 'mysql': }

php::module { 'gd': }

class { 'mysql': }

mysql::grant { 'wordpress':
      mysql_user     => 'wordpressuser',
      mysql_password => 'password',
}

class { 'nginx':
    template => "nginx/nginx.conf.erb",
}

nginx::vhost { 'wp.example.com' :
    docroot     => '/var/www/html/wordpress',
    template    => 'nginx/vhost.conf.erb',
  }