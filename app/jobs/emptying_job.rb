class EmptyingJob < ApplicationJob
  queue_as :default

  def perform
    user_list = User.where("confirmation_date < ?", DateTime.now-20)

    user_list.each do |user|
      User.delete(user)
    end
  end
end
