class HallidayWineList::Wine

  attr_reader :winery, :variety, :location, :category

  @@all_wines = []

  def self.all_wines
    @@all
  end

  def self.print_wines
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
    HallidayWineList::Scraper.new.scrape_wines
  end

end
