class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :set_group
  # before_action :move_to_index, except: [:index, :show, :search]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.create(tweet_params)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:name, :image, :text, :user_id, :group_id).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
