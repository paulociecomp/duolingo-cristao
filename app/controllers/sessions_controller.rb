class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :failure]

  def new
    redirect_to root_path if current_user
  end

  def create
    user = User.from_omniauth(auth_hash)

    if user.persisted?
      session[:user_id] = user.id
      redirect_to root_path, notice: "Bem-vindo, #{user.name}!"
    else
      redirect_to login_path, alert: "Erro ao fazer login. Tente novamente."
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path, notice: "Logout realizado com sucesso!"
  end

  def failure
    redirect_to login_path, alert: "Falha na autenticação: #{params[:message]}"
  end

  private

  def auth_hash
    request.env["omniauth.auth"]
  end
end
