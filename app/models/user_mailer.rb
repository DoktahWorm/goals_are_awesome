class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
  
    @body[:url]  = "#{DEFAULTS[:base_url]}/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = DEFAULTS[:base_url]
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = DEFAULTS[:admin_email]
      @subject     = DEFAULTS[:application_name]
      @sent_on     = Time.now
      @body[:user] = user
    end
end
