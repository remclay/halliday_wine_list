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
    categories = HallidayWineList::Category.all_categories
    puts ""
    puts "Categories:"
    list_categories
    puts ""
    puts "Choose a category (1-#{categories.count}) to view wines in that category, type 'list' to see all wines or type exit to leave."
    @input = gets.strip.downcase
    if users_choice >= 0 && users_choice < (categories.count)
      puts "Showing: #{categories[users_choice].name}."
      puts "--------------------------------------------"
      print_category_wines
    elsif @input == "exit"
      goodbye
    elsif @input == "list"
      print_all_wines
    else
      puts ""
      puts "Sorry, that input is not valid. Here are your options again."
      choose_category
    end
    next_steps
  end

  def next_steps
    puts ""
    puts "--------------------------------------------"
    puts "What would you like to do next? (1-3)"
    puts "1 View categories"
    puts "2 List all wines"
    puts "3 Exit"
    input = gets.strip.to_i
    if input == 1
      choose_category
    elsif input == 2
      print_all_wines
      next_steps
    elsif input == 3
      goodbye
    else
      puts "Sorry, I don't recognise that input. Please enter a valid input (1-3)."
      next_steps
    end
  end

  def print_category_wines
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
