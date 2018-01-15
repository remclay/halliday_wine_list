class HallidayWineList::Wine

  attr_accessor :winery, :variety, :location

  def self.wines
  self.scrape_wines
  end

  def self.scrape_wines
    wines = []
binding.pry
    url = HallidayWineList::Category.categories[Testa.users_choice].url
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
