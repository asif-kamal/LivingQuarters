class HostsController < ApplicationController
  skip_before_action :require_log_in, only: [:new, :create]
  before_action :set_host, only: [:show, :edit, :update, :destroy]
  include HostsHelper

  def new
    @host = Host.new
  end

  def create
    @host = Host.create(host_params)
    if @host.save
      session[:user_id] = @host.id
      redirect_to host_path(@host)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @host.update(host_params)
      redirect_to host_path(@host)
    else
      render :edit
    end
  end

  def destroy
    @host.destroy
    redirect_to signin_path
  end


  private

  def set_host
    @host = Host.find_by(id: session[:user_id])
  end

  def host_params
    params.require(:host).permit(:name, :email, :origin, :admin, :uid, :provider, :password)
  end
end
