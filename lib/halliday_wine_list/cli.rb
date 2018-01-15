class HallidayWineList::CLI
  #CLI controller

  def call
    puts "James Halliday Top 100 Wines 2017"
    list_categories
  end

  def list_categories
    puts "--------------------------------------------"
    puts "2017 Categories"
    HallidayWineList::Category.categories
    choose_category
  end

  def choose_category
    puts "Please choose a category to view selected wines (1-6) or type exit."
    input = gets.strip
    case input
    when "1"
      puts "Showing Selected Red Wines under $25"
    when "2"
      puts "Showing Selected White Wines under $20"
    when "3"
      puts "Showing Selected Red Wine over $25"
    when "4"
      puts "Showing Selected White Wine over $20"
    when "5"
      puts "Showing Selected Champagne"
    when "6"
      puts "Showing Selected Sparkling"
    when "exit"
      puts "Goodbye. Please visit again soon."
      exit
    else
      puts "Invalid input."
      choose_category
  end
end


end
