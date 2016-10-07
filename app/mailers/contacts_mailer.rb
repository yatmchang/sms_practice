class ContactsMailer < ApplicationMailer
  def notify_owner(contact)
    @contact   = contact
    mail(to: 'yatmchang@gmail.com', subject: "You received a new message!")
  end
end
