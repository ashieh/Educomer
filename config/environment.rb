# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Educomer::Application.initialize!

Encoding.default_external = Encoding::UTF-8
Encoding.default_internal = Encoding::UTF-8
