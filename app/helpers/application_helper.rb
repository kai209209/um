module ApplicationHelper
  def apply_user_friend(current_user, user)
    apply_friend = current_user.author_apply_friends.find_by(receiver_id: user)
    judgement = apply_friend && (apply_friend.apply? || apply_friend.pass?)
    apply_friend_status = apply_friend && apply_friend.pass? ? "你们已经是好友了" : "已申请，请等候通过"
    route = judgement ? "#" : (apply_friend ? reapply_apply_friends_path(receiver_id: user) : apply_friends_path(receiver_id: user))
    send_method = apply_friend ? :patch : :post

    link_to_if judgement, apply_friend_status, "#", class: "btn btn-info btn-xs disabled", id: "apply_user_#{user.id}" do 
      link_to "发送好友申请", route, class: "btn btn-info btn-xs", id: "apply_user_#{user.id}", method: send_method, remote: true
    end
  end
end
