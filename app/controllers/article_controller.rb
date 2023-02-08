class ArticleController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        u = User.find(params[:user_id])
        a = u.articles.create(
            title: params[:title], 
            content: params[:content], 
            date: params[:date], 
            likesNo: params[:likesNo], 
            commentNo: params[:commentNo], 
            article_imageURL: params[:article_imageURL]
        )

        @categoryArray = params[:categories]
        @categoryArray.each{
            |categoryEle|
            ArticleCategory.create(article_id: a.id, category_id: categoryEle)
        }

        render json: a
    end

    def readAll 
        @articles = Article.all
        render json: @articles
    end

    def readByTitle
        a = Article.where("title LIKE ?", "%#{params[:title]}%")
        render json: a
    end

    def readPage 
        pages = (params[:pageNo]).to_i
        pages = pages - 1;
        lim = 2
        a = 0
        for i in 1..pages
            a += lim
        end
        a = Article.offset(a).limit(lim)
        render json: a 
    end

    def readByRange
        a = Article.where(date: (params[:start]..params[:end]))
        render json: a
    end
    
    # def readByAuthor
    #     a = Article.where(author: params[:author])
    #     render json: a
    # end

    # def readByCategory
    #     a = Article.where(category: params[:category])
    #     render json: a
    # end

    # def updateById
    #     a = Article.update(params[:id], title: params[:title], author: params[:author], body: params[:body], category: params[:category], date: params[:date])
    #     render json: a
    # end

    # def updateByTitle
    #     a = Article.where(title: params[:title]).update(title: params[:title], author: params[:author], body: params[:body], category: params[:category], date: params[:date])
    #     render json: a
    # end

    def update
        a = Article.find(params[:id])
        a.title = params[:title] || a.title
        a.content = params[:content] || a.content
        a.date = params[:date] || a.date
        a.article_imageURL = params[:article_imageURL] || a.article_imageURL
        a.save
        render json: a
    end


    def delete
        a = Article.find(params[:id])
        ArticleCategory.where(article_id: a.id).each{
            |a|
            a.delete
        }
        a.delete
        render json: a
    end

    def deleteAll
        ArticleCategory.delete_all
        a = Article.delete_all
    end

    # private
    # def user_params
    #     params.permit(:article_title, :article_content, :createdOn, :article_imageURL)
    # end
end
