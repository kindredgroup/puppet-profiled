# unibet-profiled

[![Build Status](https://secure.travis-ci.org/unibet/puppet-profiled.png)](http://travis-ci.org/unibet/puppet-profiled)

## Overview

## Description

This module handles /etc/profile.d files

## Usage

### profiled

```
include ::profiled
```

### profiled::script

Configure custom profile.d script
```
profiled::script { 'date':
  content => 'echo $(date)'
}
```
