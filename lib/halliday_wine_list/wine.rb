class HallidayWineList::Wine

  attr_accessor :winery, :variety, :location

#Keep track of all wines, print out list of wines.

  @@all_wines = []

  def self.all_wines
    @@all_wines.each.with_index(1) do |w, i|
      puts "#{i} #{w.winery} - #{w.variety} - #{w.location}."
    end
  end

  def initialize(winery= "N/A", variety= "N/A", location= "N/A")
    @winery = winery
    @variety = variety
    @location = location
    all_wines << self
  end

  def new_from_scraper(winery, variety, location)
    self.new(winery, variety, location)
  end
  
# MOVE TO SCRAPER CLASS
  def self.wines
  self.scrape_wines
  end

  def self.scrape_wines
    wines = []
    category_url = HallidayWineList::Category.categories[Testa.users_choice].url
    url = "https://www.winecompanion.com.au" + "#{category_url}"
    doc = Nokogiri::HTML(open(url))
    doc.css("div.clearfix ul.listing-items div.info").each do |item|
      #w = HallidayWineList::Wine.new()
      w = item.css("p.winery").text
      v = item.css("p.variety").text
      l = item.css("p.location").text
      HallidayWineList::Wine.new_from_scraper(w, v, l)
    end
    #wines
  end

end
