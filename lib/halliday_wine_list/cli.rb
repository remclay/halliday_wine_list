class HallidayWineList::CLI
  #CLI controller

  def call
    puts "James Halliday Top 100 Wines 2017"
    list_categories
  end

  def list_categories
    puts "--------------------------------------------"
    puts "2017 Categories"
    @categories = HallidayWineList::Category.categories
    @categories.each.with_index(1) do |c, i|
      puts "#{i} - #{c.name}"
    end
    choose_category
  end

  def choose_category
    puts "Please choose a category to view selected wines (1-6) or type exit."
    input = gets.strip.downcase

    if input.to_i > 0
      puts @categories[input.to_i - 1].name
    elsif input == "exit"
      goodbye
    else
      puts "Invalid input."
      choose_category
    end
  end

  def goodbye
    puts "Goodbye. Please visit again soon."
    exit
  end

end
