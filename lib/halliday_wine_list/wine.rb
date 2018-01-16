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
    @@all_wines << self
  end

  def self.new_from_scraper(winery, variety, location)
    self.new(winery, variety, location)
  end

  def self.create_wines
    #Call scraper.
    HallidayWineList::Scraper.new.scrape_wines
    
  end

end
