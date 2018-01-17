class HallidayWineList::CLI

  def start
    puts ""
    puts "James Halliday Top Wines 2017"
    puts "--------------------------------------------"
    puts "Retrieving all Reds and Whites from the 2017 Top 100 Wines.."
    collect_data
    choose_category
  end

  def choose_category
    puts ""
    puts "Categories:"
    list_categories
    puts ""
    puts "Choose a category (1-4) to view wines in that category."
    puts "Type list to see all wines or type exit."
    @input = gets.strip.downcase
    categories = HallidayWineList::Category.all_categories
    if users_choice >= 0 && users_choice < (categories.count)
      puts "Showing: #{categories[users_choice].name}."
      puts "--------------------------------------------"
      reveal_wines
      next_steps
    elsif @input == "exit"
      goodbye
    elsif @input == "list"
      print_all_wines
      next_steps
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
    HallidayWineList::Category.all_categories[users_choice].print_wines
  end

  def users_choice
    @input.to_i - 1
  end

  def goodbye
    puts "Goodbye. Please visit again soon."
    exit
  end

  def collect_data
    HallidayWineList::Category.create_categories
  end

  def list_categories
    HallidayWineList::Category.print_categories
  end

  def print_all_wines
    HallidayWineList::Wine.print_wines
  end
end
