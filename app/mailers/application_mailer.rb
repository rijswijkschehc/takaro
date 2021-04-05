# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@rhcspeelwijze.nl'
  layout 'mailer'
end
