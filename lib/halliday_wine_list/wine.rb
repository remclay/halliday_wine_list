class HallidayWineList::Category

  attr_accessor :name

  def self.categories
    #I should return all of the categories
    puts "1 - Best Red Wine under $25 (20 wines selected)"
    puts "2 - Best White Wine under $20 (20 wines selected)"
    puts "3 - Best Red Wine over $25 (20 wines selected)"
    puts "4 - Best White Wine over $20 (20 wines selected)"
    puts "5 - Best Champagne (12 wines selected)"
    puts "6 - Best Sparkling (8 wines selected)"
    puts "--------------------------------------------"  
  end

end