Rails.application.routes.draw do

  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  get "admin", to: "products#index"
  resources :project_view, only: [] do
    collection do
      get ":slug_cate", to: "project_view#index", as: :index
      get ":slug_cate/:slug_project", to: "project_view#show", as: :show
    end
  end
  resources :post_view, only: [] do
    collection do
      get ":slug_cate", to: "post_view#index", as: :index
      get ":slug_cate/:slug_post", to: "post_view#show", as: :show
    end
  end
  resources :product_view, only: [] do
    collection do
      get ":slug_cate", to: "product_view#index", as: :index
      get ":slug_cate/:slug_pro", to: "product_view#show", as: :show
    end
  end
  resources :page_view, only: [] do
    collection do
      get ":slug", to: "page_view#show", as: :show
    end
  end
  resources :home, only: [:index]
  root "home#index"
  scope :admin do
    resources :facebooks
    resources :facebook_admins
    resources :supports
    resources :category_projects, only: [:index] do
      collection do
        post "", to: "category_projects#add_category", as: "add_category"
        post "/delete", to: "category_projects#delete_category", as: "delete_category"
      end
    end
    resources :property_projects
    resources :projects do
      resources :photo_projects
      collection do
        post ":id", to: "projects#update_feature", as: "update_feature"
      end
    end
    resources :products do
      collection do
        post ":id", to: "products#update_feature", as: "update_feature"
        post ":id/lasted", to: "products#update_lasted", as: "update_lasted"
      end
    end
    resources :properties
    resources :posts do
      collection do
        post ":id", to: "posts#update_active", as: "update_active"
      end
    end
    resources :category_posts do
      collection do
        post "", to: "category_posts#add_category", as: "add_category"
        post "/delete", to: "category_posts#delete_category", as: "delete_category"
      end
    end
    resources :pages do
      collection do
        post ":id", to: "pages#update_active", as: "update_active"
      end
    end
    resources :categories, only: [:index] do
      collection do
        post "", to: "categories#add_category", as: "add_category"
        post "/delete", to: "categories#delete_category", as: "delete_category"
      end
    end
  end

end
