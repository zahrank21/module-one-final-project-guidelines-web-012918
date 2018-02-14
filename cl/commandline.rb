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

  def greeting
    #greeting the user, and calling whereabout to find which location they want
    puts "Are you ready to find a job?! (y/n)"
    answer = gets.chomp.downcase
    if answer == "y" || answer == "yes"
      puts "1. Location or 2. Company? (1 or 2)"
      number_answer = gets.chomp.to_i
      if number_answer == 1
        whereabouts
      elsif number_answer == 2
        employer
      else
        puts "Choose 1 or 2 next time."
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
  end

  def companies_list
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
      binding.pry
      if id == number
        puts "Looking in #{location}..."
        location_jobs(number)
      elsif number > locations_list.size || number <= 0 || number.class != Fixnum
        puts "Invalid command. Please try again"
        return whereabouts
      end
    end
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
