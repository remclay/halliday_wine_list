class HallidayWineList::CLI
  #CLI controller

  def call
    puts "James Halliday Top 100 Wines 2017"
    list_categories
  end

  def list_categories
    puts "--------------------------------------------"
    puts "1 - Best Red Wine under $25 (20 wines selected)"
    puts "2 - Best White Wine under $20 (20 wines selected)"
    puts "3 - Best Red Wine over $25 (20 wines selected)"
    puts "4 - Best White Wine under $20 (20 wines selected)"
    puts "5 - Best Champagne (12 wines selected)"
    puts "6 - Best Sparkling (8 wines selected)"
    puts "--------------------------------------------"
    choose_category
    #check out here docs to potentially improve this method
  end

  def choose_category
    puts "Please choose a category to view. Enter 1-6."
    input = gets.strip
  end


end
