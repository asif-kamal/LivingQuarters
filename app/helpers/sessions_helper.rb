module SessionsHelper

  def sign_in_logic
    if params[:host]
      if host = Host.find_by(name: params[:host][:name]).try(:authenticate, params[:host][:password])
        session[:user_id] = host.id
        redirect_to host_path(host)
      else
        flash[:notice] = "Invalid username or password"
        redirect_to signin_path
      end
    elsif host = Host.find_or_create_by!(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password_digest = auth['uid']
      end
      session[:user_id] = host.id
      redirect_to host_path(host)
    else
      flash[:notice] = "Invalid username or password"
      redirect_to signin_path
    end
  end

  def login_error
    flash[:notice]
  end

end
