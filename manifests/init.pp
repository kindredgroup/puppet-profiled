# == Class: profiled
#
# Installs and configures /etc/profile.d files
#
# === Parameters
#
# [*owner*]
#   user to be owning /etc/profile.d directory
#
# [*group*]
#   group to be owning /etc/profile.d directory
#
# [*mode*]
#   mode to be set for /etc/profile.d directory
#
# === Examples
# 
# include profiled
#
# === Copyright
#
# Copyright 2015 North Development AB
#

class profiled (
  $owner      = 'root',
  $group      = 'root',
  $dir_mode   = '0755',
  $file_mode  = '0644'
) {

  file {'/etc/profile.d':
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => $dir_mode,
  }

}

