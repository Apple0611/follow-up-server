# Set the working application directory
# working_directory "/path/to/your/app"
working_directory Rails.root

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid working_directory + "/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path pid working_directory + "/log/unicorn-err.log"
stdout_path pid working_directory + "/log/unicorn-out.log"

# Unicorn socket
listen "/tmp/unicorn." + Rails.application.class.parent_name + ".sock"

# Number of processes
# worker_processes 4
worker_processes 1

# Time-out
timeout 30
