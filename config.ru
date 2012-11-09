# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

# Not override -E option or LANG and apply only for ruby > 1.9
if Object.const_defined?(:Encoding) && !ENV['LANG'] && !ENV['RUBYOPT'].include?('-E')
Encoding.default_internal = 'iso-8859-1'
Encoding.default_external = 'iso-8859-1'
end 

run Educomer::Application
