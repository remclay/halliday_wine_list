
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "halliday_wine_list/version"

Gem::Specification.new do |spec|
  spec.name          = "halliday_wine_list"
  spec.version       = HallidayWineList::VERSION
  spec.authors       = ["'Remmy Clay'"]
  spec.email         = ["'remmy.lauren@gmail.com'"]

  spec.summary       = "A gem that displays the red and white wines in the James Halliday Top 100 Wines of 2017."
  spec.description   = "A gem that retreives all red and white wines selected in the James Halliday Top 100 Wines of 2017 and displays those wines via category or lists all selections."
  spec.homepage      = "https://github.com/remclay/halliday_wine_list"
  #Update to gem's website or public repo URL here.
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #if spec.respond_to?(:metadata)
  #  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  #else
  #  raise "RubyGems 2.0 or newer is required to protect against " \
  #    "public gem pushes."
  #end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  #spec.bindir        = "exe"
  spec.executables   << "halliday_wine_list"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"

end
