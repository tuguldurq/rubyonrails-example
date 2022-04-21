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
        @files = Upload.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:alert] = "You have successfully updated. "
            redirect_to @article
        else
            render :edit, status: :unprocessable_entity
        end
    end
    
    def new
        @article = Article.new
    end
    
    def create
        uploaded_file = params[:article][:file].original_filename
        @article = Article.new(article_params)
        
        if @article.save
            File.open(Rails.root.join('public', 'uploads', uploaded_file), 'wb') do |file|
                Upload.create(path: uploaded_file, article_id: @article.id)
                file.write(uploaded_file)
            end
            redirect_to @article
        else 
            render :new, status: :unprocessable_entity
        end
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
