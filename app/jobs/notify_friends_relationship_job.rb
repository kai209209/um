class NotifyFriendsRelationshipJob < ApplicationJob
  queue_as :default

  def perform(author, receiver)
    ActionCable.server.broadcast("user_#{author.id}_room_channel",
                                 new_friends_relationship: render_notify_friends_relationship(author),
                                 friends_relationship_notification: render_friends_relationship_notification(receiver),
                                 operate: "notify_friends_relationship")

    ActionCable.server.broadcast("user_#{receiver.id}_room_channel",
                                 new_friends_relationship: render_notify_friends_relationship(receiver),
                                 operate: "notify_friends_relationship")
  end

  private

  def render_notify_friends_relationship(user)
    ApplicationController.render(partial: 'users/friend_item', collection: user.friends, as: :friend)
  end

  def render_friends_relationship_notification(receiver)
    ApplicationController.render(partial: 'notification/friends_relationship', locals: { user: receiver })
  end

end
