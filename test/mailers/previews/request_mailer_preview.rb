# Preview all emails at http://localhost:3000/rails/mailers/request_mailer
class RequestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/request_mailer/requested_listing
  def requested_listing
    listing = Listing.last
    RequestMailer.requested_listing(listing)
  end

end
