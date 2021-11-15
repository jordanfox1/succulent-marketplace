require "test_helper"

class RequestMailerTest < ActionMailer::TestCase
  test "requested_listing" do
    mail = RequestMailer.requested_listing
    assert_equal "Requested listing", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
