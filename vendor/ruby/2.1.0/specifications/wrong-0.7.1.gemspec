# -*- encoding: utf-8 -*-
# stub: wrong 0.7.1 ruby lib

Gem::Specification.new do |s|
  s.name = "wrong"
  s.version = "0.7.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Steve Conover", "Alex Chaffee"]
  s.date = "2013-11-11"
  s.description = "Wrong provides a general assert method that takes a predicate block. Assertion failure\nmessages are rich in detail. The Wrong idea is to replace all those countless assert_this,\nassert_that library methods which only exist to give a more useful failure message than\n\"assertion failed\". Wrong replaces all of them in one fell swoop, since if you can write it\nin Ruby, Wrong can make a sensible failure message out of it. Also provided are several\nhelper methods, like rescuing, capturing, and d."
  s.email = "sconover@gmail.com"
  s.extra_rdoc_files = ["README.markdown"]
  s.files = ["README.markdown"]
  s.homepage = "http://github.com/sconover/wrong"
  s.rubyforge_project = "wrong"
  s.rubygems_version = "2.2.2"
  s.summary = "Wrong provides a general assert method that takes a predicate block.  Assertion failure messages are rich in detail."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<predicated>, ["~> 0.2.6"])
      s.add_runtime_dependency(%q<ruby_parser>, [">= 3.0.1"])
      s.add_runtime_dependency(%q<ruby2ruby>, [">= 2.0.1"])
      s.add_runtime_dependency(%q<sexp_processor>, [">= 4.0"])
      s.add_runtime_dependency(%q<diff-lcs>, ["~> 1.2.5"])
    else
      s.add_dependency(%q<predicated>, ["~> 0.2.6"])
      s.add_dependency(%q<ruby_parser>, [">= 3.0.1"])
      s.add_dependency(%q<ruby2ruby>, [">= 2.0.1"])
      s.add_dependency(%q<sexp_processor>, [">= 4.0"])
      s.add_dependency(%q<diff-lcs>, ["~> 1.2.5"])
    end
  else
    s.add_dependency(%q<predicated>, ["~> 0.2.6"])
    s.add_dependency(%q<ruby_parser>, [">= 3.0.1"])
    s.add_dependency(%q<ruby2ruby>, [">= 2.0.1"])
    s.add_dependency(%q<sexp_processor>, [">= 4.0"])
    s.add_dependency(%q<diff-lcs>, ["~> 1.2.5"])
  end
end
