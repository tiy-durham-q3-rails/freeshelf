# -*- encoding: utf-8 -*-
# stub: sprig 0.1.6 ruby lib

Gem::Specification.new do |s|
  s.name = "sprig"
  s.version = "0.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Lawson Kurtz", "Ryan Foster"]
  s.date = "2014-06-27"
  s.description = "Sprig is a library for managing interconnected, environment-specific seed data."
  s.email = ["lawson.kurtz@viget.com", "ryan.foster@viget.com"]
  s.homepage = "http://www.github.com/vigetlabs/sprig"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Relational, environment-specific seeding for Rails apps."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, ["~> 3.1"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3.8"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14.0"])
      s.add_development_dependency(%q<database_cleaner>, ["~> 1.2.0"])
      s.add_development_dependency(%q<webmock>, ["~> 1.15.0"])
      s.add_development_dependency(%q<vcr>, ["~> 2.8.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<generator_spec>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<coveralls>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.1"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3.8"])
      s.add_dependency(%q<rspec>, ["~> 2.14.0"])
      s.add_dependency(%q<database_cleaner>, ["~> 1.2.0"])
      s.add_dependency(%q<webmock>, ["~> 1.15.0"])
      s.add_dependency(%q<vcr>, ["~> 2.8.0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<generator_spec>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<coveralls>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.1"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3.8"])
    s.add_dependency(%q<rspec>, ["~> 2.14.0"])
    s.add_dependency(%q<database_cleaner>, ["~> 1.2.0"])
    s.add_dependency(%q<webmock>, ["~> 1.15.0"])
    s.add_dependency(%q<vcr>, ["~> 2.8.0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<generator_spec>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<coveralls>, [">= 0"])
  end
end
