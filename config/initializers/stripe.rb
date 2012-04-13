if ENV['RAILS_ENV'] == "production"
   yml_file = '/stripe.yml'
else
   yml_file = '/stripe.yml.private'
end


apiconfig = YAML.load_file(File.expand_path(File.dirname(__FILE__)) + yml_file )

STRIPE_TEST_PUBLIC_KEY= ENV['STRIPE_TEST_PUBLIC_KEY'] || apiconfig["stripe"]["test_public_key"]  
STRIPE_TEST_PRIVATE_KEY= ENV['STRIPE_TEST_PRIVATE_KEY'] || apiconfig["stripe"]["test_private_key"]  
# STRIPE_LIVE_PUBLIC_KEY= ENV['STRIPE_LIVE_PUBLIC_KEY'] || apiconfig["stripe"]["live_public_key"]
# STRIPE_LIVE_PRIVATE_KEY= ENV['STRIPE_LIVE_PRIVATE_KEY'] || apiconfig["stripe"]["live_private_key"]


Stripe.api_key = STRIPE_TEST_PRIVATE_KEY