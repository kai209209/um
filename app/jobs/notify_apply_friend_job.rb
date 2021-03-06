class NotifyApplyFriendJob < ApplicationJob
  queue_as :default

  def perform(apply_friend)
    ActionCable.server.broadcast("user_#{apply_friend.receiver.id}_room_channel",
                                 apply_friend: render_notify_apply_friend(apply_friend),
                                 apply_friend_notification: render_apply_friend_notification(apply_friend.receiver),
                                 apply_friend_count: apply_friend.receiver.receiver_apply_friends.apply_status.count,
                                 operate: "notify_apply_friend")

  end

  private

  def render_notify_apply_friend(apply_friend)
    ApplicationController.render(partial: 'apply_friends/apply_friend', locals: { apply_friend: apply_friend })
  end

  def render_apply_friend_notification(receiver)
    ApplicationController.render(partial: 'notification/apply_friend', locals: { user: receiver })
  end
end
