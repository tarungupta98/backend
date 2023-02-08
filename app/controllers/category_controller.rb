class CategoryController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        c = Category.create(name: params[:name])
        render json: c
    end

    def readAllCategory
        c = Category.all
        render json: c
    end

    def findByCategory
        @art = []
        ArticleCategory.where(category_id: params[:category_id]).each {
            |a|
            @art.push(Article.where(id: a.article_id)[0])
        }
        
        render json: @art
    end
end
