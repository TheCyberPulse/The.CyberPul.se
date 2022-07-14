# config valid for current version and patch releases of Capistrano
lock '~> 3.17.0'

set :application, 'the.cyberpul.se'
set :repo_url, 'git@github.com:TheCyberPulse/The.CyberPul.se.git'
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, 'config/link_dictionary.yml'

# Default value for linked_dirs is []
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets'

# Default value for default_env is {}
# set :default_env, { path: '/opt/ruby/bin:$PATH' }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

set :ssh_options, :forward_agent => true

set :asdf_tools, %w{ ruby }
set :asdf_map_ruby_bins, %w{ bundle gem rake ruby }
