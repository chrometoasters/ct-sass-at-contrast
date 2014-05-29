# Compass configuration file
# This is loaded by the Grunt plugin
# and configuration is done here where possible to allow developers to bypass Grunt if they desire

# Tips: https://gist.github.com/timkelty/1595176

# Usage sans Grunt
# Note: exec runs the executable that comes with a gem in your bundle
# 1. cd into the folder containing this file
# 1. bundle exec compass compile OR # bundle exec compass watch

# Require gems and Compass plugins
require "compass"

# General
output_style = :expanded
# <%= project.root %>/
project_path = File.dirname(__FILE__) + "/"

# Sass Paths
http_path = ""

# Sass Directories
css_dir = ""
sass_dir = ""