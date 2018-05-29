## fluent-plugin-parser-logfmt

This plugin is a parser plugin for [fluentd](https://github.com/fluent/fluentd) 1.0 or later, which parses log lines formatted in [logfmt](https://brandur.org/logfmt).

[<img src="https://travis-ci.org/moriyoshi/fluent-plugin-parser-logfmt.svg?branch=master" alt="Build Status" />](https://travis-ci.org/moriyoshi/fluent-plugin-parser-logfmt) 

## Installation

```
$ gem install fluent-plugin-parser-logfmt
```

## Configuration


## Output: Configuration

```
<source>
  @type tail
  tag foo.bar
  <parse>
    @type logfmt
    time_format "%Y-%m-%d %H:%M:%S"
  </parse>
  path ...
  pos_file ...
</source>
```

* `time_format`

* `time_key`
