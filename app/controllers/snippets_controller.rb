class SnippetsController < ApplicationController

  def index
    @snippets = Snippet.all
  end

  def show
    @snippet = Snippet.find params[:id]
    @category = Category.find params[:category_id]
    markdown = Redcarpet::Markdown.new(Pygment,
    no_intra_emphasis: true, autolink: true, tables: true, fenced_code_blocks: true   )
    @code = markdown.render(@snippet.code)
  end

  def new
    @snippet = Snippet.new
    @categories = Category.all
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
