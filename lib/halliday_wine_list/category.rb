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


  category_1 = self.new
  category_1.name = "Best Red Wine under $25"
  category_1.url = "https://www.winecompanion.com.au/wines/2017-best-red-wines-under-25"

  category_2 = self.new
  category_2.name = "Best White Wine under $20"
  category_2.url = "https://www.winecompanion.com.au/wines/2017-best-white-wines-under-20"

  [category_1, category_2]
  
  end
end
