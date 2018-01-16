class HallidayWineList::Scraper

  #CATEGORIES
  def scrape_categories
    doc = Nokogiri::HTML(open("https://www.winecompanion.com.au/wines/james-hallidays-top-100-wines-of-2017"))
    doc.css("div.clearfix.bestofbest ul.listing-items h3.sub-title").each do |item|
      name = item.css("a").text
      url = item.css("a").attr("href").value
      HallidayWineList::Category.new_from_scraper(name, url)
    end
  end

  #WINES
  def scrape_wines
    # improve call to this method from wine class (remove instantiation)
    category_url = HallidayWineList::Category.all_categories[Testa.users_choice].url
    url = "https://www.winecompanion.com.au" + "#{category_url}"
    doc = Nokogiri::HTML(open(url))
    doc.css("div.clearfix ul.listing-items div.info").each do |item|
      w = item.css("p.winery").text
      v = item.css("p.variety").text
      l = item.css("p.location").text
      HallidayWineList::Wine.new_from_scraper(w, v, l)
    end
  end
end
