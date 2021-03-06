class RelationshipsController < ApplicationController
  # ——————フォロー機能を作成・保存・削除する————————————
  def create
    current_user.follow(params[:user_id])
    redirect_to user_path(params[:user_id])
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to user_path(params[:user_id])
  end
#————————フォロー・フォロワー一覧を表示する-————————————
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end
end
