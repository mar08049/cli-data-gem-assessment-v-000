class BaliHotelFinder::CLI

  def call
    puts "Here are the best Bali Hotels and Resorts!"
    list_locations
    hotel_list
    goodbye
  end

  def list_locations
    puts "In what area would you like to stay?"
    puts "-----------------------------------"
    puts <<-DOC
        1. Jimbaran
        2. Nusa Dua
        3. Pekutatan
        4. Ubud
        5. Denspasar
        6. Seminyak
        7. Legian
        8. Tabanan
      DOC
      @locations = BaliHotelFinder::Hotel.hotel
      @locations.each.with_index(1) do |hotel, i|
        puts "#{i}. #{hotel.name} - #{hotel.location}"
        puts "#{hotel.rating} - #{hotel.contact}"
      end
  end

  def hotel_list
    puts "Enter the number associated with the area you would like to stay in or type 'exit'"
    input = nil
    while input != "exit"
      puts "Enter another number or type 'exit'"
      input = gets.strip.downcase

      if input.to_i > 0
        puts @hotels[input._i-1]
      else
        "Enter the number associated with the area you would like to stay in or type 'exit'"
      end
    end
  end

  def goodbye
    puts "Come back for more information!!!"
  end
end
