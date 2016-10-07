class ChargesController < ApplicationController
  def new
    @contact = Contact.find params[:contact_id]
  end

  def create
    contact = Contact.find params[:contact_id]

    stripe_customer = Stripe::Customer.create(
      email: "#{contact.email}",
      description: "#{contact.name}",
      source: params[:stripe_token]
    )
    stripe_charge = Stripe::Charge.create(
      amount: (contact.amount * 100).to_i,
      currency: "cad",
      customer: stripe_customer.id,
      description: "Payment for id #{contact.id}"
    )

    contact.stripe_transaction_id = stripe_charge.id
    contact.save

    ContactsMailer.notify_owner(contact).deliver_now
    redirect_to root_path, notice: "Payment completed / Message Sent!"
  end

end
