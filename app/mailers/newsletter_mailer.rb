class NewsletterMailer < ApplicationMailer
  def newsletter_email(user)
    @test_recipient = daveporter@me.com
    # @url  = 'http://example.com/login'
    mail(to: @test_recipient, subject: 'Test to daveporter@me.com - WARVRA Newsletter')
  end
end
