class HomeController < ApplicationController
  before_action :authenticate_user, {only: [:top, :save, :add]}
  before_action :forbid_login_user, {only: [:welcome]}

  def welcome
  end

  def top
    @lists = List.where(user: @current_user.id)
    if @config.sort == 0
      @lists = @lists.all.order("id")
    elsif @config.sort == 1
      @lists = @lists.all.order("status1")
    elsif @config.sort == 2
      @lists = @lists.all.order("status1 desc")
    elsif @config.sort == 3
      @lists = @lists.all.order("status2")
    elsif @config.sort == 4
      @lists = @lists.all.order("status2 desc")
    elsif @config.sort == 5
      @lists = @lists.all.order("date")
    elsif @config.sort == 6
      @lists = @lists.all.order("date desc")
    end
  end

  def help
  end
  def rule
  end
  def contact
  end

  def save
    @list = List.find_by(id: params[:id])
    @list.company = params[:company]
    @list.type1 = params[:type1]
    @list.type2 = params[:type2]
    @list.detail = params[:detail]
    @list.status1 = params[:status1]
    @list.status2 = params[:status2]
    @list.date = params[:date]
    @list.note = params[:note]
    @list.save
    redirect_to("/top")
  end

  def add
    @list = List.new(
      user: @current_user.id,
      company: params[:company],
      type1: params[:type1],
      type2: params[:type2],
      detail: params[:detail],
      status1: params[:status1],
      status2: params[:status2],
      date: params[:date],
      note: params[:note]
    )
    @list.save
    redirect_to("/top")
  end

  def sort
    @config.sort = params[:sort]
    @config.save
    redirect_to("/top")
  end

end
