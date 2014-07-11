# -*- encoding: utf-8 -*-
# stub: identicon 0.0.3 ruby lib

Gem::Specification.new do |s|
  s.name = "identicon"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Victor Gama"]
  s.date = "2014-05-12"
  s.description = "A simple github-like identicons generator."
  s.email = ["hey@vito.io"]
  s.homepage = "http://github.com/victorgama/identicon"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "A simple github-like identicons generator."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<chunky_png>, [">= 0"])
    else
      s.add_dependency(%q<chunky_png>, [">= 0"])
    end
  else
    s.add_dependency(%q<chunky_png>, [">= 0"])
  end
end
