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
      number_answer = gets.chomp
      if number_answer == 1
        whereabouts
      elsif number_answer == 2
        employer
      else
        puts "Choose 1 or 2 next time."
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
        jobs(number).each do |job|
          puts job.name
        end
      elsif number > locations_list.size || number <= 0
        puts "Invalid command. Please try again"
        whereabouts
      end
    end
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
        jobs(number).each do |job|
          puts job.name
        end
      elsif number > locations_list.size || number <= 0
        puts "Invalid command. Please try again"
        whereabouts
      end
    end
  end

  def locations_list
    #lists out all unique locations, numbered
    numbered_locations = {}

    Location.all.each do |location|
      numbered_locations[location.id] = location.name
    end
    numbered_locations.each do |key, value|
      puts "#{key}: #{value}"
    end
    puts "Done"
  end


  def company
    #
    puts "Is there a specific company you would like to work for..."
    answer = gets.chomp.downcase

    if answer == "y" || "yes"

    end
  end


  def jobs(loca_id)
    #lists all jobs in a certain location
    Job.all.select do |job|
      job.location_id == loca_id

    end
  end

  def
