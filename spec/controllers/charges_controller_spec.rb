require 'rails_helper'
require 'stripe_mock'

RSpec.describe ChargesController, type: :controller do
  let(:stripe_helper) { StripeMock.create_test_helper }
  before { StripeMock.start }
  after { StripeMock.stop }

  describe "#create" do
    context "with valid attributes" do
      def valid_request
        post :create, charge: {number: 4012888888881881,
                               cvc: 100,
                               exp_year: 18,
                               exp_month: 11}
      end

      # it "sends an e-mail" do
      #   expect { valid_request }.to change{ActionMailer::Base.deliveries.count}.by(1)
      # end
    end

  end
end
