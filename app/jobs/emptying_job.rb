class EmptyingJob < ApplicationJob
  queue_as :default

  def perform
    user_list = User.where("confirmation_date < ?", DateTime.now-20)

    user_list.each do |user|
      if user.reconfirmation_needed?
        UserMailer.cancel_confirmation(user).deliver_now
        User.delete(user)
      end
    end
  end
end
