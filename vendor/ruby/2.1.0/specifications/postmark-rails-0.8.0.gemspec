# -*- encoding: utf-8 -*-
# stub: postmark-rails 0.8.0 ruby lib

Gem::Specification.new do |s|
  s.name = "postmark-rails"
  s.version = "0.8.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Petyo Ivanov", "Ilya Sabanin", "Artem Chistyakov"]
  s.date = "2014-06-05"
  s.description = "The Postmark Rails Gem is a drop-in plug-in for ActionMailer to send emails via Postmark, an email delivery service for web apps."
  s.email = "tema@wildbit.com"
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.files = ["LICENSE", "README.md"]
  s.homepage = "http://postmarkapp.com"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.2.2"
  s.summary = "Postmark adapter for ActionMailer"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionmailer>, [">= 3.0.0"])
      s.add_runtime_dependency(%q<postmark>, ["~> 1.3.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<actionmailer>, [">= 3.0.0"])
      s.add_dependency(%q<postmark>, ["~> 1.3.0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<actionmailer>, [">= 3.0.0"])
    s.add_dependency(%q<postmark>, ["~> 1.3.0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
