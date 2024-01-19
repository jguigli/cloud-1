<?php

$i = 1;
// Use SSL for connection
$cfg['Servers'][$i]['ssl'] = true;
$cfg['Servers'][$i]['ssl_key'] = '/etc/ssl/server-key.pem';
$cfg['Servers'][$i]['ssl_cert'] = '/etc/ssl/server-cert.pem';
$cfg['Servers'][$i]['ssl_ca'] = '/etc/ssl/server-cert.pem';
$cfg['Servers'][$i]['ssl_verify'] = false;
$cfg['ForceSSL'] = true;

?>