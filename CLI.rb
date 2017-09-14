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
  
