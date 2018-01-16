class HallidayWineList::Category

  attr_accessor :name, :url

  @@all_categories = []
  
  def self.all_categories
    @@all_categories
  end

  def self.print_categories
    @@all_categories.each.with_index(1) do |c, i|
      puts "#{i} - #{c.name}"
      puts "--------------------------------------------"
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

end
