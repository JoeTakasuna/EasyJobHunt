class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:logout]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}

  def new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], password: params[:password])
    if @user.save
      @config = Config.new(user_id: @user.id, sort: 0)
      @config.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/top")
    else
      render("users/new")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインが完了しました"
      redirect_to("/top")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @name = params[:name]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

end
