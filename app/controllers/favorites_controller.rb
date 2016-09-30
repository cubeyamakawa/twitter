class FavoritesController < ApplicationController
 	def create
	    @tweet = Tweet.find(params[:tweet_id])
	    @favorite = current_user.favorites.new(tweet: @tweet)

	    if @favorite.save
	    	redirect_to tweets_url, notice: "お気に入りに追加しました。"
	    else
	    	redirect_to tweets_url , alert: "お気に入りに追加できません。"
	    end
	end

	def destroy
		@favorite = current_user.favorites.find_by!(tweet_id: params[:tweet_id])
		@favorite.destroy
		redirect_to tweets_url, notice: "お気に入りを解除しました。"
	end
end
