# == Class: profiled::script
#
# === Copyright
#
# Copyright 2015 North Development AB
#

define profiled::script (
  $script       = $name,
  $ensure       = 'present',
  $content      = 'absent',
  $content_file = 'absent',
  $source       = 'absent',
  $shell        = '/bin/bash',
) {

  # Make sure pre-requisites are fulfilled
  require ::profiled

  # Sanity check
  if ($content == 'absent') and ($content_file == 'absent') and ($source == 'absent') {
    fail('You must pass in one of the following parameters $content, $content_file, $source on definition')
  }

  if (($content != 'absent' and ($content_file != 'absent' or $source != 'absent')) or ($source != 'absent' and $content_file != 'absent')) {
    fail('Only one of the following $content, $content_file, $source parameters can be set on definition')
  }

  # Create script file resource
  file {"/etc/profile.d/${script}":
    ensure  => $ensure,
    owner   => $profiled::owner,
    group   => $profiled::group,
    mode    => $profiled::file_mode,
    require => File['/etc/profile.d'],
  }

  # Set options
  if ($source != 'absent') {
    File["/etc/profile.d/${script}"] {
      source => $source
    }
  }

  if ($content != 'absent') {
    File["/etc/profile.d/${script}"] {
      content => template("${module_name}/script.erb")
    }
  }

  if ($content_file != 'absent') {
    File["/etc/profile.d/${script}"] {
      content => template($content_file)
    }
  }

}
