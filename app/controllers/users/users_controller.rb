class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(current_user.id)
  end

  def chargeEdit
    @user = User.find(current_user.id)
  end

  def charge
    amount = params[:amount].to_f # 入力された金額を数値に変換

    # ログインしているユーザーの残高を取得
    @user = User.find(current_user.id)
    value = @user.value

    # チャージ後の残高を計算
    new_value = value + amount

    # ユーザーの残高を更新
    if @user.update(value: new_value)
      redirect_to show_path(@user.id), notice: 'チャージが完了しました！'
    else
      flash.now[:alert] = '内容を確認してください'
      render :chargeEdit
    end
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to show_path(@user.id), notice: '編集が完了しました！'
    else
      flash.now[:alert] = '編集内容を確認してください'
      render :edit
    end
  end

  def unsubscribe
    @user = User.find(current_user.id)
  end

  def destroy
    @user = User.find(current_user.id)
    if @user.update(is_active: "無効")
      reset_session
      redirect_to root_path, notice: '退会が完了しました。ご利用ありがとうございました'
    else
      flash.now[:alert] = '退会が正常に行われませんでした'
      render :unsubscribe
    end
  end

    private
  def user_params
    params.require(:user).permit(:name, :introduction, :image, :is_active)
  end

end