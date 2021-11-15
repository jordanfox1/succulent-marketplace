class RequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.request_mailer.requested_listing.subject
  #
  def requested_listing(listing)
    @greeting = "Hi"
    @listing = listing
    @lister = @listing.user
    @requester = User.first

    mail to: @listing.user.email, 
          subject: "New request for #{@listing.name}"
  end
end
