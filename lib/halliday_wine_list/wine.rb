class HallidayWineList::Wine

  attr_accessor :winery, :variety, :location

  def self.wines
  #wine_1 = self.new
  #wine_1.winery = "Angove Family Winemakers"
  #wine_1.variety = "Grenache Shiraz Mourvedre"
  #wine_1.location = "McLaren Vale"

  #wine_2 = self.new
  #wine_2.winery = "Castelli Estate"
  #wine_2.variety = "Shiraz"
  #wine_2.location = "Great Southern"

  #[wine_1, wine_2]
  self.scrape_wines
  end

  def self.scrape_wines
    wines = []
    url = 
    doc = Nokogiri::HTML(open("url"))
    doc.css("").each do |item|
      w = self.new
      w.name = item.css("a").text
      w.url = item.css("a").attr("href").value
      wines << w
    end
    wines
  end

end
