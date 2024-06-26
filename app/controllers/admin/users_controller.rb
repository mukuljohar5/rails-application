module Admin
  class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
    skip_before_action :verify_authenticity_token

    def index
      @users = User.all
    end

    def show
    end

    def new
      @user = User.new
    end

    def edit
    end

    def create
      @user = User.new(user_params)
      email_send_to_user = @user.send_email

      respond_to do |format|
        if @user.save
          format.html { redirect_to user_url(@user), notice: "User was successfully created." }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @user.destroy!
      raise "User not destoryed" if @user.empty?

      respond_to do |format|
        format.html { redirect_to users_url, notice: "User was successfully deleted." }
        format.json { head :no_content }
      end
    end

    def send_email_to_user
      user = UserMailer.with(user: User.first).welcome_email.deliver_now
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
  end
end
