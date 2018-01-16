class HallidayWineList::CLI
  #CLI controller

  def call
    puts "James Halliday Top 100 Wines 2017"
    list_categories
  end

  def list_categories
    puts "--------------------------------------------"
    puts "2017 Categories"
    collect_categories
    list_categories
    choose_category
  end

  def choose_category
    puts "Please choose a category to view selected wines (1-6) or type exit."
    @input = gets.strip.downcase

    if @input.to_i > 0 && @input.to_i <= @categories.count
      #refactor to use #choice
      puts @categories[users_choice].name
      collect_wines
      list_wines
    elsif @input == "exit"
      goodbye
    else
      puts "Invalid input."
      choose_category
    end
  end

  def users_choice
    i = @input.to_i - 1
  end
  
  def goodbye
    puts "Goodbye. Please visit again soon."
    exit
  end

  def collect_categories
    HallidayWineList::Category.create_categories
  end

  def list_categories
    HallidayWineList::Category.all_categories
  end
  
  def collect_wines
    HallidayWineList::Wine.create_wines
  end

  def list_wines
    puts "--------------------------------------------"
    HallidayWineList::Wine.all_wines
  end

end
