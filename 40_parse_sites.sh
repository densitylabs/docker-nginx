#!/bin/bash

echo 'Creating config file'

# from http://pempek.net/articles/2013/07/08/bash-sh-as-template-engine/
# render a template configuration file
# expand variables + preserve formatting
render_template() {
  eval "echo \"$(cat $1)\""
}

for f in /sites/*.conf; do
  if [[ $VERBOSE_TEMPLATES != "" ]]; then
    echo "rendering template $f"
    render_template $f
  fi
  render_template $f > etc/nginx/conf.d/$(basename $f)
done
