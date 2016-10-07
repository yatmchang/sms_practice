require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "validations" do
    it "creates a single pin of V6B 1G8" do
      c = Contact.create FactoryGirl.attributes_for(:contact)
      expect(c.latitude.round(2)).to eq(49.28)
    end

    it "doesn't create a pin with invalid address" do
      c = Contact.create FactoryGirl.attributes_for(:contact).merge({address: "invalid address" })
      expect(c.latitude).not_to be
    end
  end
end
