class ArticlesController < ApplicationController
    def index
        @me = "Hello, It's me. "
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:alert] = "You have successfully updated. "
            redirect_to @article
        end
    end
    
    def new
        @artice = Article.new
    end
    
    def create

    end

    def destroy
        @article = Article.find(params[:id])
        @article.destroy

        redirect_to root_path, status: :see_other
    end
    private
        def article_params
            params.require(:article).permit(:title, :body)
        end
end
