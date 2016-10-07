FactoryGirl.define do
  factory :charge do
    number { 4012888888881881 }
    exp_month { 11 }
    exp_year { 18 }
    cvc { 111 }
  end
end
