Rails.application.routes.draw do

  #User
  post "/user/create", to: "user#create"
  get "/users", to: "user#readAllUser"
  get "/user/:id", to: "user#readUser"
  delete "/user/delete/:id", to: "user#delete"

  #Article
  post "/article/create", to: "article#create"
  get "/articles", to: "article#readAll"
  get "/article/title/:title", to: "article#readByTitle"
  get "/article/page/:pageNo", to: "article#readPage"
  get "/article/range", to: "article#readByRange"
  get "/article/category/:category", to: "article#readByCategory"
  put "/article/update/:id", to: "article#update"
  delete "/article/delete/:id", to: "article#delete"
  delete "/article/delete_all", to: "article#deleteAll"

  #Category
  post "/category/create", to: "category#create"
  get "/categories", to: "category#readAllCategory"
  get "/category/:category_id", to: "category#findByCategory"
  
  #ArticleCategory
  get "/articlecategory", to: "article_category#readAll"

end
