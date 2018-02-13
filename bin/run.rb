require_relative '../config/environment'
require_relative '../app/models/adapter.rb'
require_relative '../app/models/company.rb'
require_relative '../app/models/job.rb'
require_relative '../app/models/location.rb'

Adapter.api_call

binding.pry

"hi"
