class HallidayWineList::Category

  attr_accessor :name, :url

  def self.categories
    self.scrape_categories
  end

  def self.scrape_categories
    # On main site, find categories, extract name and url, instantiate categories => array of categories
    # Will ultimately move into scraper class
    categories = []
    doc = Nokogiri::HTML(open("https://www.winecompanion.com.au/wines/james-hallidays-top-100-wines-of-2017"))
    doc.css("div.clearfix.bestofbest ul.listing-items h3.sub-title").each do |item|
      c = self.new
      c.name = item.css("a").text
      c.url = item.css("a").attr("href").value
      categories << c
    end
    categories
  end
end
