# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'RHC Speelwijze <noreply@rhcspeelwijze.nl>'
  layout 'mailer'
end
