class FollowsController < ApplicationController
	before_filter :require_login
	def create
		@user = User.find(params[:user_id])
		if @user.reverse_follows.create(follower: current_user)
			redirect_to tweets_url, notice: "フォローしました"
		else
			redirect_to tweets_url, notice: "フォローできません"
		end
	end
	def destroy
		@user = User.find(params[:user_id])
		follow = @user.reverse_follows.find_by(follower: current_user.id)
		follow.destroy
		redirect_to tweets_url, notice:"フォロー解除しました"
	end
end
