class NewUserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def confirmation_instructions(record, token, opts={})
    opts[:from] = %("Janice from Beebsy" <janice@beebsy.com>)
    opts[:bcc] = 'janice@beebsy.com'
    opts[:subject] = 'Thanks for joining Beebsy!'
    opts[:reply_to] = 'janice@beebsy.com'
    super
  end

  def reset_password_instructions
    opts[:from] = %("Beebsy" <no-reply@beebsy.com>)
    opts[:subject] = 'Reset Your Password'
    opts[:reply_to] = 'no-reply@beebsy.com'
  end

  def unlock_instructions
    opts[:from] = %("Beebsy" <no-reply@beebsy.com>)
    opts[:subject] = 'Unlock Your Account'
    opts[:reply_to] = 'no-reply@beebsy.com'
  end
end
