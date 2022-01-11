# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@thatrandomadmin.com'
  layout 'mailer'
end
