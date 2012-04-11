if Rails.env.production?
  ActiveMerchant::Billing::Base.mode = :test #:production
  ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
    :login => "paypro_1322631075_biz_api1.gmail.com",
    :password => "1322631131",
    :signature => "AHoQVY-yF7DI0sVOZqCHGhbaFOAeAP2QNlmFHwY-edgj2kBbJ4Tnly2U"
  )
elsif Rails.env.development?
  ActiveMerchant::Billing::Base.mode = :test
  ::GATEWAY = ActiveMerchant::Billing::PaypalGateway.new(
    :login => "paypro_1322631075_biz_api1.gmail.com",
    :password => "1322631131",
    :signature => "AHoQVY-yF7DI0sVOZqCHGhbaFOAeAP2QNlmFHwY-edgj2kBbJ4Tnly2U"
  )
else #test    
  ActiveMerchant::Billing::Base.mode = :test
  ::GATEWAY = ActiveMerchant::Billing::BogusGateway.new
end 