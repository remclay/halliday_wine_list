class HallidayWineList::Wine

  attr_accessor :category
  attr_reader :winery, :variety, :location

  @@all_wines = []

  def self.all_wines
    @@all_wines
  end

  def self.print_wines
    @@all_wines.each.with_index(1) {|w, i| puts "#{i} #{w.winery} - #{w.variety} - #{w.location}."}
  end

  def initialize(winery= nil, variety= nil, location= nil, category)
    @winery = winery
    @variety = variety
    @location = location
    @@all_wines << self
    self.category = category
    category.add_wine(self)
  end

  def self.new_from_scraper(winery, variety, location, category)
    self.new(winery, variety, location, category)
  end
end
