class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @picture.save
        ContactMailer.contact_mail(@picture, current_user).deliver
        redirect_to pictures_path, notice: "新たに投稿しました！"
      else
        render :new
      end
    end
  end
  
  def confirm
    @picture = Picture.new(picture_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  def show
    @picture = Picture.find(params[:id])
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
    @picture = Picture.find(params[:id])
    unless current_user.id == @picture.user.id
      flash.now[:danger] = "他のユーザーの投稿は編集できません！"
      render :show
    end
  end

  def update
    @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    if current_user.id == @picture.user.id
      @picture.destroy
      redirect_to pictures_path, notice: "投稿を削除しました！"
    else
      flash.now[:danger] = "他のユーザーの投稿は削除できません！"
      render :show
    end
  end

  private
  
  def picture_params
    params.require(:picture).permit(:image, :image_cache, :content)
  end

end
