class BaliHotelFinder::Hotel

  attr_accessor :name, :location, :website_url, :contact, :description

  @@all = []

  def self.new_from_index_page(i)
    self.new(
      i.css("h2").text,
      "https://travel.usnews.com/Hotels/Bali_Indonesia/#{i.css("a").attribute("href").text}",
      i.css("h3").text,
      i.css(".position").text
      )
  end

  def initialize(name=nil, url=nil, location=nil)
    @name = name
    @url = url
    @location = location
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def location
    @best_dish ||= doc.xpath("path").text
  end

  def contact
    @contact ||= doc.xpath("path").text.split("+").join(". Tel: +")
  end

  def website_url
    @website_url ||= doc.xpath("path").text
  end

  def description
    @description ||= doc.xpath("path").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end
