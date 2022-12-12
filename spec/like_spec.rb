require 'rails_helper'

describe Like, type: :model do
  context 'test likes' do
    before :each do
      @user = User.create(name: 'Jennie', photo: 'https://unsplash.com/photos/Th-i7Z1ufK8', bio: 'Artist')
      @post = Post.create(author: @user, title: 'Cafe', text: 'My fav place')
      @comment = Comment.create(post: @post, author: @user, text: 'Love it!')
    end

    it 'comments author should equal user who made the comment' do
      expect(@comment.author).to eq @user
    end
  end
end
