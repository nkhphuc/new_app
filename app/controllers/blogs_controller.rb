# frozen_string_literal: true

# Controller for blogs
class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end
end
