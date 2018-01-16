class HallidayWineList::CLI

  def start
    puts "James Halliday Top 100 Wines 2017"
    puts "--------------------------------------------"
    puts "2017 Categories"
    collect_categories
    choose_category
  end

  def choose_category
    list_categories
    puts ""
    puts "Please choose a category (1-6) to view wines selected within that category or type exit."
    @input = gets.strip.downcase
    categories = HallidayWineList::Category.all_categories
    if users_choice >= 0 && users_choice < (categories.count)
      puts "Showing: #{categories[users_choice].name}."
      puts "--------------------------------------------"
      reveal_wines
      next_steps
    elsif @input == "exit"
      goodbye
    else
      puts "Invalid input."
      choose_category
    end
  end

  def next_steps
    puts ""
    puts "What would you like to do next?"
    puts "1 View categories"
    puts "2 Exit"
    input = gets.strip.to_i
    #binding.pry
    if input == 1
      choose_category
    elsif input == 2
      goodbye
    else
      puts "Invalid input"
      next_steps
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
    HallidayWineList::Category.print_categories
  end

  def collect_wines
    HallidayWineList::Wine.create_wines
  end

  def list_wines
    HallidayWineList::Wine.print_wines
  end
end
