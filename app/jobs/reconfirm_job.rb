class ReconfirmJob < ApplicationJob
  queue_as :default

  def perform
    user_list = User.where("confirmation_date < ?", DateTime.now-15)

    user_list.each do |user|
      UserMailer.registration_confirmation(user).deliver_now
    end
  end
end
