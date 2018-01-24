class HallidayWineList::Category

  attr_reader :name, :url

  @@all_categories = []

  def self.all_categories
    @@all_categories
  end

  def self.print_categories
    @@all_categories.each.with_index(1) {|c, i| puts "#{i} - #{c.name}"}
  end

  def initialize(name= nil, url= nil)
    @wines = []
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

  def add_wine(wine)
    @wines << wine
  end

  def print_wines
    @wines.each.with_index(1) {|w, i| puts "#{i} #{w.winery} - #{w.variety} - #{w.location}."}
  end
end
