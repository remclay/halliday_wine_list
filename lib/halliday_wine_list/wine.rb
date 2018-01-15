class HallidayWineList::Wine

  attr_accessor :winery, :variety, :location

  def self.wines
  wine_1 = self.new
  wine_1.winery = "Angove Family Winemakers"
  wine_1.variety = "Grenache Shiraz Mourvedre"
  wine_1.location = "McLaren Vale"

  wine_2 = self.new
  wine_2.winery = "Castelli Estate"
  wine_2.variety = "Shiraz"
  wine_2.location = "Great Southern"

  [wine_1, wine_2]

  end

end
