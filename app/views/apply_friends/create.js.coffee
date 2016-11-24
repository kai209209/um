$("#apply_user_<%= @user.id %>").replaceWith('<%= j apply_user_friend(current_user, @user)%>')
