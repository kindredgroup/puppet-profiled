# unibet-bash

[![Build Status](https://secure.travis-ci.org/unibet/puppet-bash.png)](http://travis-ci.org/unibet/puppet-bash)

## Overview

## Description

This module handles bash.

## Usage

### bash

```
class { 'bash':
  ensure   => present,
  packages => [array]
}
```

### bash::timeout

Configure bash timeout
```
bash::timeout { $::id:
  timeout   => '60',
  user_home => "/home/$::id"
}
```
