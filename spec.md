# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
      HallidayWineList::CLI class encapsulates the CLI. The CLI class displays messages to the user (including welcome message, main menu, next steps menu and farewell message), receives user input in response to those messages (via gets) and calls the method(s) applicable to the user input.

- [x] Pull data from an external source
      The HallidayWineList::Scraper class is responsible for scraping the 'Wine Companion' website to retrieve the applicable categories of red and white wines. Each category has a unique URL path, which is then used to scrape the wines within that category.

- [x] Implement both list and detail views
      The categories are displayed in a list (via HallidayWineList::Categories.print_categories). Once the user selects a category, or opts to view all wines, the applicable wines are displayed in detail (winery - variety} - location).
