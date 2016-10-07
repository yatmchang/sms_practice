require 'rails_helper'
require 'stripe_mock'

RSpec.describe ChargesController, type: :controller do
  let(:stripe_helper) { StripeMock.create_test_helper }
  before { StripeMock.start }
  after { StripeMock.stop }

  describe "#create" do
    context "with valid attributes" do
      def valid_request
        post :create, charge: FactoryGirl.attributes_for(:charge)
      end

      # it "sends an e-mail" do
      #   expect { valid_request }.to change{ActionMailer::Base.deliveries.count}.by(1)
      # end
    end

  end
end
