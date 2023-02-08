class ArticleCategoryController < ApplicationController
    skip_before_action :verify_authenticity_token
    def readAll
        a = ArticleCategory.all
        render json: a
    end
end
