# -*- encoding: utf-8 -*-
# stub: headless 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "headless"
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Leonid Shevtsov"]
  s.date = "2014-06-03"
  s.description = "    Headless is a Ruby interface for Xvfb. It allows you to create a headless display straight from Ruby code, hiding some low-level action.\n"
  s.email = "leonid@shevtsov.me"
  s.homepage = "http://leonid.shevtsov.me/en/headless"
  s.requirements = ["Xvfb"]
  s.rubygems_version = "2.2.2"
  s.summary = "Ruby headless display interface"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.6"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.6"])
  end
end
