class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    microposts = Micropost.find(params[:micropost_id])
    current_user.favorite(microposts)
    flash[:success] = 'いいねしました。'
    redirect_to current_user
  end

  def destroy
    microposts = Micropost.find(params[:micropost_id])
    current_user.unfavorite(microposts)
    flash[:success] = 'いいねを解除しました。'
    redirect_to current_user
  end
end
