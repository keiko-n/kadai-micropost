# 全てのコントローラがApplicationControllerを継承しているので、ここの記述すれば全てで使用可能になる
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
      # unless は if の反対で、if は true のときに実行するが unless は false のときに実行する
      unless logged_in?
      redirect_to login_url
      end
  end
  
  def counts(user)
    @count_microposts = user.microposts.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
  end
end  
