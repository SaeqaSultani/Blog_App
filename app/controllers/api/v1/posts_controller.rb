class Api::V1::PostsController < ApplicationController
    skip_before_action :authenticate_user!
    def index
      u = User.find(params[:user_id])
      post_data = u.posts
      render json: post_data
    end
  end