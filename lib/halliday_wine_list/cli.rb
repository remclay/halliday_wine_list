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
    @input = gets.strip.downcase

    if @input.to_i > 0 && @input.to_i <= @categories.count
      #refactor to use #choice
      puts @categories[users_choice].name
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
    #binding.pry
  end

  def goodbye
    puts "Goodbye. Please visit again soon."
    exit
  end

  def list_wines
    puts "--------------------------------------------"
    @wines = HallidayWineList::Wine.all_wines
  end

end
