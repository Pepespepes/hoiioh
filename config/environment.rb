# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

config.web_socket_server_url = "wss://hoiioh.com/cable"

config.action_cable.allowed_request_origins = ['https://hoiioh.com', 'http://hoiioh.com']
