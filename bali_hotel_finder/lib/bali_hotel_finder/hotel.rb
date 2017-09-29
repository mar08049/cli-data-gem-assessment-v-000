class BaliHotelFinder::Hotel
  attr_accessor :name, :rating, :location, :address

  def self.hotel
    self.scrape_hotels
  end


  def self.scrape_hotels
    hotels = []
    hotels << self.scrape_site
    hotels
  end

  def self.scrape_site
    doc = Nokogiri::HTML(open("https://travel.usnews.com/Hotels/Bali_Indonesia/"))

    hotel = self.new
    name = doc.search("h3.ellipsis-text search-results-link").text
    location = doc.search("block-tight text-small").text
    rating = doc.search("div.media-body").text
    address = doc.search("p.text-loose hero-ranking-data-contact-block-normal text-small").text
    hotel
  end
end
