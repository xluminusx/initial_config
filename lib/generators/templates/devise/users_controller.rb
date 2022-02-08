class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
  
    def index
      @q = User.ransack(params[:q])
      @users = @q.result.page(params[:page])
    end
  
    def new
      @user = User.new
    end
  
    def edit
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to home_index_path, notice: 'Usúario atualizado!'
      else
        render :new
      end
    end
  
    def update
      if @user.update(user_params)
        redirect_to perfil_edit_path, notice: 'Usuário atualizado!.'
      else
        render :edit
      end
    end
  
    def destroy
      begin
      @user.destroy
      redirect_to user_index_path, notice: 'Registro excluído!'
      rescue StandardError
        redirect_to user_index_path, alert: 'Registros utilizam esse Usuário!'
      end
    end
  
    private
      def set_user
        @user = User.find(params[:id])
      end
  
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
  end
  