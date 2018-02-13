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
      whereabouts
    else
      puts "Come back later, you bum!"
    end
  end

  def whereabouts
    #Lists the available locations and accepts a number answer (hopefully works for
    #locations that are listed as double digit numbers)
    puts "Here is a list of destinations with openings..."
    locations_list
    puts "Please enter the number of the location you would like to work at"
    number = gets.chomp.to_i
    locations_list.each do |location|
      if number < 10
        if location[0].to_i == number
          "#Looking in {location}..."
          jobs(location)
        elsif location[0..1].to_i == number
          location
          jobs(location)
        end
      end
    end
  end

  def locations_list
    #lists out all unique locations
    Adapter.api_call.each do |jobs_hash|
      locations = jobs_hash.select do |key, value|
        key["location"].uniq
      end
    end

    counter = 0

    while counter < locations.length
      puts "#{counter}: #{locations[counter]}"
      counter += 1
    end

  end


  def company
    #
    puts "Is there a specific company you would like to work for..."
    answer = gets.chomp.downcase

    if answer == "y" || "yes"

    end
  end


  def jobs(location)
    #lists all jobs in a certain location
    Adapter.api_call.each do |jobs_hash|
      jobs_hash.select do |key, value|
        if key["location"].downcase == location.downcase
          key["title"]
        end
      end
    end
  end
