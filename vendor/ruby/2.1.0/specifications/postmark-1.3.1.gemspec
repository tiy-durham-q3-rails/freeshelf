# -*- encoding: utf-8 -*-
# stub: postmark 1.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "postmark"
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.7") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Petyo Ivanov", "Ilya Sabanin", "Artem Chistyakov"]
  s.date = "2014-06-05"
  s.description = "Use this gem to send emails through Postmark HTTP API and retrieve info about bounces."
  s.email = "ilya@wildbit.com"
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.files = ["LICENSE", "README.md"]
  s.homepage = "http://postmarkapp.com"
  s.licenses = ["MIT"]
  s.post_install_message = "\n    ==================\n    Thanks for installing the postmark gem. If you don't have an account, please\n    sign up at http://postmarkapp.com/.\n\n    Review the README.md for implementation details and examples.\n    ==================\n  "
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.2.2"
  s.summary = "Official Postmark API wrapper."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<mail>, [">= 0"])
      s.add_development_dependency(%q<activesupport>, ["~> 3.0"])
      s.add_development_dependency(%q<yajl-ruby>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<mail>, [">= 0"])
      s.add_dependency(%q<activesupport>, ["~> 3.0"])
      s.add_dependency(%q<yajl-ruby>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<mail>, [">= 0"])
    s.add_dependency(%q<activesupport>, ["~> 3.0"])
    s.add_dependency(%q<yajl-ruby>, [">= 0"])
  end
end
