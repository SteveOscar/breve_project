class Admin::TagsController < Admin::BaseController

  def new

  end

  def index
    @tag = Tag.new
    @tags = Tag.all
    @user = current_user
  end

  def create
    @tag = Tag.create(tag_params)
    flash.now[:success] = "#{@tag.name.upcase} Tag Created!"
    render :index
  end

  def destroy
    tag = Tag.find(params[:id])
    tag.delete
    redirect_to admin_tags_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
