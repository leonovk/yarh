# YARH

[![Build Status](https://github.com/leonovk/yarh/actions/workflows/ruby.yml/badge.svg)](https://github.com/leonovk/yarh/actions/workflows/ruby.yml) ![Gem](https://img.shields.io/gem/dt/yarh) [![Gem Version](https://badge.fury.io/rb/yarh.svg)](https://badge.fury.io/rb/yarh)

## Yet Another Request Handler

The idea is to create complex chains of HTTP requests using only Yaml files and without writing a single line of code. The point is that it would be convenient to create chains of HTTP requests for local testing or any other similar purposes.

## Installation

Gem installation


```
gem install yarh
```

## Usage

All you need is to create an yaml file with the http request specification.

For example:

```yaml
request:
  url: https://example.com/api/v1/users
  method: POST
  headers:
    Content-Type: application/json
  body:
    name: John Doe
    email: john.doe@example.com
```

then run a simple command from the console:

```
yarh -r file_path
```
Yarh will fulfill this request himself.

You can create multiple requests in one file.

```yaml
request_1:
  url: https://example.com/api/v1/users
  ...
request_2:
  url: https://example.com/api/v2/users
  ...
```

## Contribution

If you would like to contribute to the development, submit a pull request with your changes. We welcome any contributions that improve the service. You can also view the current project board here.  You can also contribute by reporting bugs or suggesting new features. Please use the GitHub issues for that.
