class HallidayWineList::Scraper

  def scrape_categories
    doc = Nokogiri::HTML(open("https://www.winecompanion.com.au/wines/james-hallidays-top-100-wines-of-2017"))
    doc.css("div.clearfix.bestofbest ul.listing-items h3.sub-title").each do |item|
      name = item.css("a").text
      @url = item.css("a").attr("href").value
      if name.include?("red") || name.include?("white")
        @current_category = HallidayWineList::Category.new_from_scraper(name, @url)
        scrape_wines
      end
    end
  end

  def scrape_wines
    category_url = "https://www.winecompanion.com.au" + "#{@url}"
    doc = Nokogiri::HTML(open(category_url))
    doc.css("div.clearfix ul.listing-items div.info").each do |item|
      winery = item.css("p.winery").text
      variety = item.css("p.variety").text
      location = item.css("p.location").text
      category = @current_category
      HallidayWineList::Wine.new_from_scraper(winery, variety, location, category)
    end
  end
end
