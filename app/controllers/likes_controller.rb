class LikesController < ApplicationController
    def new
      @like = Like.new
    end
end