class HallidayWineList::Category

  attr_accessor :name, :url

  def self.categories
    #I should return all of the categories
    #puts "1 - Best Red Wine under $25 (20 wines selected)"
    #puts "2 - Best White Wine under $20 (20 wines selected)"
    #puts "3 - Best Red Wine over $25 (20 wines selected)"
    #puts "4 - Best White Wine over $20 (20 wines selected)"
    #puts "5 - Best Champagne (12 wines selected)"
    #puts "6 - Best Sparkling (8 wines selected)"
    #puts "--------------------------------------------"
    self.scrape_categories
  end

  def self.scrape_categories
    # On main site, find categories, extract name and url, instantiate categories => array of categories
    # Will ultimately create into scraper class
    categories = []
    doc = Nokogiri::HTML(open("https://www.winecompanion.com.au/wines/james-hallidays-top-100-wines-of-2017"))
    doc.css("ul.listing-items li").each do |item|
      c = self.new
      c.name = item.css(".bestofbest-item h3").text
      #c.url = item.css(".bestofbest-item h3 a").attr("href").value
      categories << c
    end
  end
end
