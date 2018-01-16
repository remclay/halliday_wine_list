class HallidayWineList::CLI

  def start
    puts "James Halliday Top 100 Wines 2017"
    puts "--------------------------------------------"
    puts "2017 Categories"
    collect_categories
    list_categories
    puts ""
    choose_category
  end

  def choose_category
    puts "Please choose a category (1-6) to view wines selected within that category or type exit."
    @input = gets.strip.downcase
    #if @input.to_i > 0 && @input.to_i <= @categories.count
    if users_choice > 1 && users_choice < (@categories.count - 1)
      puts "Showing: #{@categories[users_choice].name}."
      puts "--------------------------------------------"
      reveal_wines
    elsif @input == "exit"
      goodbye
    else
      puts "Invalid input."
      choose_category
    end
  end

  def reveal_wines
    collect_wines
    list_wines
  end
  
  def users_choice
    @input.to_i - 1
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
