class BaliHotelFinder::CLI

    def call
      BaliHotelFinder::Scraper.new.make_hotels
      puts "Here are the best Bali Hotels and Resorts!"
      start
    end

    def start
      puts ""
      puts "In what area would you like to stay?"
      input = gets.strip.to_i

      print_location(input)

      puts ""
      puts "What hotel would you like to learn more about?"
      input = gets.strip

      restaurant = BaliHotelFinder::Hotels.find(input.to_i)

      print_hotels(hotel)

      puts ""
      puts "Would you like to see another hotel or resort? Enter Y or N"

      input = gets.strip.downcase
      if input == "y"
        start
      else
        puts ""
        puts "Thank you! Come back again for updated prices"
        exit
      end
    end

    def print_hotels(hotel)
      puts ""
      puts " #{hotel.name} - #{hotel.location} "
      puts ""
      puts "Location:           #{hotel.location}"
      puts "Contact:            #{hotel.contact}"
      puts "Website:            #{hotel.website_url}"
      puts ""
      puts "-Description-"
      puts ""
      puts "#{hotel.description}"
      puts ""
    end

    def print_hotels(from_number)
      puts ""
      puts "---------- Hotels #{from_number} - #{from_number+9} ----------"
      puts ""
      BaliHotelFinder::Hotels.all[from_number - 1, 10].each.with_index(from_number) do |hotel, index|
        puts "#{index}. #{hotel.name} - #{hotel.location}"
      end
    end
  end
