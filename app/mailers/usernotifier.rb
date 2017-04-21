class Usernotifier < ApplicationMailer
  default :from => 'ny826yadav@gmail.com'

    # send a signup email to the user, pass in the user object that   contains the user's email address
    def create_tweet(user)
        @user = user
        mail( :to => @user.email,
              :subject => 'Thanks for Creating Tweet for our amazing app' )
      end
end
