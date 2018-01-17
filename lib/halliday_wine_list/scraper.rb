class HallidayWineList::Scraper

  def scrape_categories
    doc = Nokogiri::HTML(open("https://www.winecompanion.com.au/wines/james-hallidays-top-100-wines-of-2017"))
    doc.css("div.clearfix.bestofbest ul.listing-items h3.sub-title").each do |item|
      name = item.css("a").text
      @url = item.css("a").attr("href").value
      @current_category = HallidayWineList::Category.new_from_scraper(name, @url)
      if name.include?("Champagne")
        scrape_champagne
      else scrape_wines
      end
    end
  end

  def scrape_wines
    category_url = "https://www.winecompanion.com.au" + "#{@url}"
    doc = Nokogiri::HTML(open(category_url))
    doc.css("div.clearfix ul.listing-items div.info").each do |item|
      w = item.css("p.winery").text
      v = item.css("p.variety").text
      l = item.css("p.location").text
      c = @current_category
      HallidayWineList::Wine.new_from_scraper(w, v, l, c)
    end
  end

  def scrape_champagne
    category_url = "https://www.winecompanion.com.au" + "#{@url}"
    doc = Nokogiri::HTML(open(category_url))
    doc.css("div.clearfix div#best-of-top").each do |item|
      binding.pry
      name = item.text
      #rating =
      #price =
      #c = @current_category
      #HallidayWineList::Wine.new_from_scraper(w, v, l, c)
    end
  end

end
