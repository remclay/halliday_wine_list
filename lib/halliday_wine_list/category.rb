class HallidayWineList::Category

  attr_accessor :name, :url

  @@all_categories = []
  
  def self.all_categories
  @@all_categories.each.with_index(1) do |c, i|
    puts "#{i} - #{c.name}"
    end
  end

  def initialize(name= "N/A", url= "N/A")
    @name = name
    @url = url
    @@all_categories << self
  end

  def self.new_from_scraper(name, url)
    self.new(name, url)
  end

  def self.create_categories
    HallidayWineList::Scraper.new.scrape_categories
  end






  def scrape_categories
    doc = Nokogiri::HTML(open("https://www.winecompanion.com.au/wines/james-hallidays-top-100-wines-of-2017"))
    doc.css("div.clearfix.bestofbest ul.listing-items h3.sub-title").each do |item|
      name = item.css("a").text
      url = item.css("a").attr("href").value
      categories << c
    end
  end
end
