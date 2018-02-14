require "pry"

  def greeting
    #greeting the user, and calling whereabout to find which location they want
    puts "Are you ready to find a job?! (y/n)"
    answer = gets.chomp.downcase
    if answer == "y" || answer == "yes"
      puts "1. By Location? 2. By Company? 3. Find Location with most jobs. 4. Find Company with most job openings."
      number_answer = gets.chomp.to_i
      if number_answer == 1
        whereabouts
      elsif number_answer == 2
        employer
      elsif number_answer == 3
        location_with_most_jobs
      elsif number_answer == 4
        company_with_most_jobs
      else
        puts "Choose 1, 2, 3, or 4 next time."
        greeting
      end
    else
      puts "Come back later, you bum!"
    end
  end

  def employer
    puts "Here is a list of companies with openings..."
    puts companies_line_by_line(companies_list)
    puts "Please enter the number of the company you would like to work at"
    number = gets.chomp.to_i

    companies_list.each do |id, company|
      if id == number
        puts "Looking in #{company}..."
        company_jobs(number)
      elsif number > companies_list.size || number <= 0 || number.class != Fixnum
        puts "Invalid command. Please try again"
        return employer
      end
    end
    greeting
  end

  def companies_list
    numbered_companies = {}

    Company.all.each do |company|
      numbered_companies[company.id] = company.name
    end
    numbered_companies
  end

  def companies_line_by_line(companies_list)
    companies_list.each do |company|
      puts "#{company[0]}: #{company[1]}"
    end
    return "done"
  end

  def company_jobs(comp_id)
    jobs_in_company = Job.all.select do |job|
      job.company_id == comp_id
    end

    jobs_in_company.each do |job|
      puts "Position available : #{job.name} at location #{Location.all.find {|location| location.id == job.location_id}.name} with #{companies_list[job.company_id]}"
    end
  end

  def company_with_most_jobs
    comp_jobs_arr = Job.all.map { |job| job.company_id  }
    freq = comp_jobs_arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    comp_id = comp_jobs_arr.max_by { |v| freq[v] }
    comp_name = Company.find_by(id: comp_id).name
    puts "#{comp_name} has the most job openings!"
  end

  def whereabouts
    #Lists the available locations and accepts a number answer (hopefully works for
    #locations that are listed as double digit numbers)
    puts "Here is a list of destinations with openings..."
    puts locations_line_by_line(locations_list)
    puts "Please enter the number of the location you would like to work at"
    number = gets.chomp.to_i

    locations_list.each do |id, location|

      if id == number
        puts "Looking in #{location}..."
        location_jobs(number)
      elsif number > locations_list.size || number <= 0 || number.class != Fixnum
        puts "Invalid command. Please try again"
        return whereabouts
      end
    end
    greeting
  end

  def locations_list
    #lists out all unique locations, numbered
    numbered_locations = {}

    Location.all.each do |location|
      numbered_locations[location.id] = location.name
    end

    return numbered_locations
  end

  def locations_line_by_line(locations_list)
    locations_list.each do |location|
      puts "#{location[0]}: #{location[1]}"
    end
    return "done"
  end

  def location_jobs(loca_id)
    #lists all jobs in a certain location
    jobs_in_location = Job.all.select do |job|
      job.location_id == loca_id
    end

    jobs_in_location.each do |job|
      puts "Position available : #{job.name} at location #{locations_list[job.location_id]} with #{Company.all.find {|company| company.id == job.company_id}.name}"
    end
  end

  def location_with_most_jobs
    loca_jobs_arr = Job.all.map { |job| job.location_id  }
    freq = loca_jobs_arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    loca_id = loca_jobs_arr.max_by { |v| freq[v] }
    loca_name = Location.find_by(id: loca_id).name
    puts "#{loca_name} has the most job openings!"
  end

  # def locations_with_most_companies
  #   #counter_hash counts how many companies are in a location
  #   # counter_hash = Hash.new(0)
  #   # Location.all.each do |location|
  #   #   Company.all.each do |company|
  #   #     binding.pry
  #   #     if location.id == company.location_id
  #   #       counter_hash[location] += 1
  #   #     end
  #   #   end
  #   # end
  #   # counter_hash.sort_by{ |k,v| v}
  #   # counter_hash.each do |location, company_num|
  #   #   puts "Location:#{location} has #{company_num} companies in the area."
  #   # end
  #
  #   #locations with most jobs
  #   # location_jobs_arr = Job.all.map { |job| job.location_id  }
  #   # freq = location_jobs_arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
  #   # loc_id = location_jobs_arr.max_by { |v| freq[v] }
  #   # loc_name = Location.find_by(id: loc_id).name
  #   # # binding.pry
  #   # puts "#{loc_name} has the most job openings. It has #{freq[loc_id]} openings."
  #   # locations with most companies
  #   counter_hash = Hash.new(0)
  #   Location.all.each do |location|
  #     Job.all.each do |job|
  #       if location.id == job.location_id
  #         counter_hash[location.id] += 1
  #       end
  #     end
  #   end
  #   counter_hash.sort_by{ |k,v| v}
  #   counter_hash.each do |location, company_num|
  #     puts "Location:#{location} has #{company_num} companies in the area."
  #   end
  # end
