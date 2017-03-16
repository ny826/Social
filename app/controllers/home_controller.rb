class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@tweet=Tweet.all
    # @tweet = Tweet.includes(:user, :likes).all.order(created_at: :desc).limit(50)
    print "in index #{@tweet}"
  end

  def create
  	content=params[:content];
  	# Tweet.create(:user=>current_user.id,:content=>content);
  	current_user.tweets.create(:content=>content);
  	return redirect_to '/';
  end

  def like
    tweet_id=params[:tweet_id];
    like=Like.where(:user_id=>current_user.id,:tweet_id=>tweet_id).first;
    print "like is #{like}";
    if like
      like.destroy;  
    else
      Like.create(:user_id=>current_user.id,:tweet_id=>tweet_id);
    end
    return redirect_to '/';
  end  

  def edit
  tweet_id=params[:tweet_id];
  print "in edit tweet id is : #{tweet_id}"
  @tweet_id=tweet_id
  end

  def edit_tweet

    tweet_id=params[:tweet_id]
    print "tweet id is : #{tweet_id}"
    content=params[:content]
    print "content is: #{content}"
    tweet=Tweet.where(:id=>tweet_id);
    tweet.content=content;
    return redirect_to '/'

  end

  def delete
  tweet_id=params[:tweet_id];
  tweet=Tweet.find_by_id(tweet_id);
  tweet.destroy;
  return redirect_to '/';
  end

  def following
    
  end

  def follower
    
  end
end
