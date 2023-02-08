class UserController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        u = User.create(
            name: params[:name], 
            username: params[:username], 
            email: params[:email], 
            password_digest: params[:password]
        )
        render json: u
    end

    def readAllUser
        u = User.all
        render json: u
    end

    def readUser
        u = User.where(id: params[:id])
        render u
    end

    def delete
        u = User.find(params[:id])
        Article.where(user_id: u.id).each{
            |art|
            ArticleCategory.where(article_id: art.id).delete_all
            art.delete
        }
        u.delete
        render json: u
    end
end
