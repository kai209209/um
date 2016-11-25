module ApplicationHelper
  def apply_user_friend(current_user, user)
    apply_friend = current_user.author_apply_friends.find_by(receiver_id: user)
    judgement, message = if current_user.friends.include?(user)
                          [true, "你们已经是好友了"]
                         elsif apply_friend && apply_friend.apply?
                          [true, "已申请，请等候通过"]
                         elsif  apply_friend && apply_friend.reject?
                          [false, "已拒绝，请重新申请！"]
                         else
                          [false, "发送好友申请"]
                         end

    route = judgement ? "#" : (apply_friend ? reapply_apply_friends_path(receiver_id: user) : apply_friends_path(receiver_id: user))
    send_method = apply_friend ? :patch : :post

    link_to_if judgement, message, "#", class: "btn btn-info btn-xs disabled", id: "apply_user_#{user.id}" do 
      link_to message, route, class: "btn btn-info btn-xs", id: "apply_user_#{user.id}", method: send_method, remote: true
    end
  end
end
