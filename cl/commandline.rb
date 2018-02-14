require "pry"

# class Commandline
  # def list_of_functions
  #   puts "Search by location"
  #   puts "Search by company"
  #   puts "Search by job title"
  # end
  #
  # def functions
  #   puts "Here are the search types available to you"
  #   list_of_functions
  # end

  def locations_with_most_companies
    #counter_hash counts how many companies are in a location
    counter_hash = Hash.new(0)
    Location.all.each do |location|
      Company.all.each do |company|
        if location.id == company.location_id
          counter_hash[location] += 1
        end
      end
    end
    counter_hash.sort_by{ |k,v| v}
    counter_hash.each do |location, company_num|
      puts "Location:#{location} has #{company_num} companies in the area."
    end

  end


  def greeting
    #greeting the user, and calling whereabout to find which location they want
    puts "Are you ready to find a job?! (y/n)"
    answer = gets.chomp.downcase
    if answer == "y" || answer == "yes"
      puts "1. By Location or 2. By Company? (1 or 2) or 3. Find Location with most job openings or 4. Find Company with most job openings"
      number_answer = gets.chomp.to_i
      if number_answer == 1
        whereabouts
      elsif number_answer == 2
        employer
      elsif number_answer == 3
        locations_with_most_companies
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
    puts companies_list
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
    binding.pry
    numbered_companies = {}

    Company.all.each do |company|
      numbered_companies[company.id] = company.name
    end

    numbered_companies

  end


  def whereabouts
    #Lists the available locations and accepts a number answer (hopefully works for
    #locations that are listed as double digit numbers)
    puts "Here is a list of destinations with openings..."
    puts locations_list
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

  def company_jobs(comp_id)
    jobs_in_company = Job.all.select do |job|
      job.company_id == comp_id
    end

    jobs_in_company.each do |job|
      puts "Position available : #{job.name} at location #{Location.all.find {|location| location.id == job.location_id}.name} with #{companies_list[job.company_id]}"
    end
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

  def company_with_most_jobs
    comp_jobs_arr = Job.all.map { |job| job.company_id  }
    freq = comp_jobs_arr.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    comp_id = comp_jobs_arr.max_by { |v| freq[v] }
    Company.find_by(id: comp_id).name
  end
