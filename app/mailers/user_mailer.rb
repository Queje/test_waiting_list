class UserMailer < ApplicationMailer
  default from: 'coworkingBrest@yopmail.com'

  def registration_confirmation(user)
    @user = user
    mail(
      from: 'coworkingBrest@yopmail.com',
      to: @user.email,
      subject: 'registration confirmation'
    )
  end

end
