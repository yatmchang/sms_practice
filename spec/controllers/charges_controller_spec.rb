require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  let (:contact) { FactoryGirl.create(:contact) }

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    context "with valid attributes" do
      def valid_request
        post :create, contact: FactoryGirl.attributes_for(:contact)
      end

      it "sends an e-mail" do
        expect { valid_request }.to change{ActionMailer::Base.deliveries.count}.by(1)
      end

    end
  end
end
