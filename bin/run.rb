require_relative '../config/environment'
require_relative '../app/models/adapter.rb'
require_relative '../app/models/company.rb'
require_relative '../app/models/job.rb'
require_relative '../app/models/location.rb'
require_relative '../db/migrate/001_create_jobs_table.rb'
require_relative '../db/migrate/002_create_locations_table.rb'
require_relative '../db/migrate/003_create_companies_table.rb'
require_relative '../db/migrate/004_insert_name_column_into_jobs.rb'


Adapter.api_call

binding.pry

"hi"
