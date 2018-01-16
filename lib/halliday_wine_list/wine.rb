class HallidayWineList::Wine

  attr_accessor :winery, :variety, :location

  def self.wines
  self.scrape_wines
  end

  def self.scrape_wines
    wines = []
    category_url = HallidayWineList::Category.categories[Testa.users_choice].url
    url = "https://www.winecompanion.com.au" + "#{category_url}"
    doc = Nokogiri::HTML(open(url))
    doc.css("div.clearfix ul.listing-items div.info").each do |item|
      w = self.new
      w.winery = item.css("p.winery").text
      w.variety = item.css("p.variety").text
      w.location = item.css("p.location").text
      wines << w
    end
    wines
  end

end
