require 'rails_helper'

describe Comment, type: :model do
  context 'test comments' do
    before :each do
      @user = User.create(name: 'Jennie', photo: 'https://unsplash.com/photos/Th-i7Z1ufK8', bio: 'Artist')
      @post = Post.create(author: @user, title: 'Cafe', text: 'My fav place')
      @comment = Comment.create(post: @post, author: @user, text: 'Love it!')
    end

    it 'should increment the comments counter' do
      expect(@post.comments_counter).to eq 1
    end
  end
end
