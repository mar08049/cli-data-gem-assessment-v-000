class BaliHotelFinder::Scraper

  def get_page
    Nokogiri::HTML(open("https://travel.usnews.com/Hotels/Bali_Indonesia/"))
  end

  def scrape_hotels_index
    self.get_page.css("a#{ellipsis-text search-results-link}")
  end
  def make_hotels
    scrape_hotels_index.each do |i|
      BaliHotelFinder::Hotel.new_from_index_page(i)
    end
  end
end
