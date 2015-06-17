class SnippetsController < ApplicationController

  def index
    if params[:search].present?
      @snippets = Snippet.search params[:search]
    else
      @snippets = Snippet.all
    end
  end

  def show
    @snippet = Snippet.find params[:id]
    @category = Category.find params[:category_id]
  end

  def new
    @snippet = Snippet.new
    @categories = Category.all
  end

  def search
    @snippet = Snippet.search params[:search]
  end

  def create
    snippet_params = params.require(:snippet).permit(:category_id, :title, :code)
    @snippet = Snippet.new snippet_params
    if @snippet.save
      flash[:notice] = "Code snippet successfully saved!  Thanks!"
      redirect_to categories_path
    else
      flash[:alarm] = "Something went wrong here!"
      render :new
    end
  end

end
