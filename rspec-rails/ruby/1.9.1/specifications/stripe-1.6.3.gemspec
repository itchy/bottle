# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{stripe}
  s.version = "1.6.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ross Boucher", "Greg Brockman"]
  s.date = %q{2012-03-22}
  s.default_executable = %q{stripe-console}
  s.description = %q{Stripe is the easiest way to accept payments online.  See https://stripe.com for details.}
  s.email = ["boucher@stripe.com", "gdb@stripe.com"]
  s.executables = ["stripe-console"]
  s.files = ["bin/stripe-console"]
  s.homepage = %q{https://stripe.com/api}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Ruby bindings for the Stripe API}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rest-client>, ["~> 1.4"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<test-unit>, [">= 0"])
    else
      s.add_dependency(%q<rest-client>, ["~> 1.4"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<test-unit>, [">= 0"])
    end
  else
    s.add_dependency(%q<rest-client>, ["~> 1.4"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<test-unit>, [">= 0"])
  end
end
