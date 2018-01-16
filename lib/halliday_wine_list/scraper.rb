class HallidayWineList::Scraper



#CATEGORIES



#WINES
  def scrape_wines
    # improve call to this method from wine class (remove instantiation)
    category_url = HallidayWineList::Category.categories[Testa.users_choice].url
    url = "https://www.winecompanion.com.au" + "#{category_url}"
    doc = Nokogiri::HTML(open(url))
    doc.css("div.clearfix ul.listing-items div.info").each do |item|
      #w = HallidayWineList::Wine.new()
      w = item.css("p.winery").text
      v = item.css("p.variety").text
      l = item.css("p.location").text
      HallidayWineList::Wine.new_from_scraper(w, v, l)
    end
  end

end