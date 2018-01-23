class HallidayWineList::Wine

  attr_accessor :category
  attr_reader :winery, :variety, :location

  @@all_wines = []

  def self.all_wines
    @@all_wines
  end

  def self.print_wines
    @@all_wines.each.with_index(1) do |w, i|
      puts "#{i} #{w.winery} - #{w.variety} - #{w.location}."
    end
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

  def self.print_regions
    @locations = @@all_wines.collect {|wine| wine.location}.uniq
    @locations.each.with_index(1) do |location, i|
      puts "#{i} - #{location}"
    end
  end

  #def self.print_by_region(location_input)
    #puts @locations[location_input - 1]
  #  @@all_wines.collect do |wine|
  #    if wine.location == location_input
  #      wine.name
  #    end
  #  end
  #end

end
