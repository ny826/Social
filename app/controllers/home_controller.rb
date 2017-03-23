class HomeController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	 @tweet=Tweet.all
    # @tweet = Tweet.includes(:user, :likes).all.order(created_at: :desc).limit(50)
  end

  def create
  	content=params[:content];
  	current_user.tweets.create(:content=>content);
  	return redirect_to '/';
  end

  def like
    tweet_id=params[:tweet_id];
    like=Like.where(:user_id=>current_user.id,:tweet_id=>tweet_id).first;
    if like
      like.destroy;  
    else
      Like.create(:user_id=>current_user.id,:tweet_id=>tweet_id);
    end
    return redirect_to '/';
  end  

  def edit
  tweet_id=params[:tweet_id];
  @tweet_id=tweet_id
  end

  def edit_tweet
    tweet_id=params[:tweet_id]
    cont=params[:content]
    tweet=Tweet.where(:id=>tweet_id).first;
    tweet.content=cont;
    tweet.save;
    print "tweet content is #{tweet.content}"
    return redirect_to '/'

  end

  def delete
  tweet_id=params[:tweet_id];
  tweet=Tweet.find_by_id(tweet_id);
  tweet.destroy;
  return redirect_to '/';
  end
  
  def search
    email=params[:email]
    @user=User.find_by_email(email);
    if !@user
    return redirect_to '/'      
    end
    
  end

  def follow
    user_id=params[:user_id]
    if !Following.where(:following_id=>user_id,:follower_id=>current_user.id).first
      Following.create(:following_id=>user_id,:follower_id=>current_user.id)
    else
      following=Following.where(:following_id=>user_id,:follower_id=>current_user.id).first
      following.destroy
    end
    return redirect_to '/'
  end

 def rate
 end
 def rate_submit
  name=params[:Name]
  description=params[:description]
  if !Feedback.find_by_user_id(current_user.id)
  Feedback.create(:user_id=>current_user.id,:name=>name,:description=>description);
  end
   return redirect_to '/'

 end

 def view_feedback
 end

def user
  @user=User.all
end

end
