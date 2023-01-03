require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Zachariah Kolacki', photo: 'https://xsgames.co/randomusers/assets/avatars/male/54.jpg', bio: 'Baker from Poland.')
    @second_user = User.create(name: 'Criselda Xander', photo: 'https://xsgames.co/randomusers/assets/avatars/female/21.jpg', bio: 'Actress from Italy.')

    @first_post = Post.create(author: @first_user, title: 'Hello', text: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.')
    @second_post = Post.create(author: @second_user, title: 'Hello 1', text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).')

    Comment.create(post: @first_post, author: @second_user, text: 'Hi!')
    Comment.create(post: @second_post, author: @first_user, text: 'Hi Criselda, Your first article is awesome!')
    Comment.create(post: @first_post, author: @first_user, text: 'Another wonderful blog!')

    Like.create(post: @first_post, author: @second_user)
    Like.create(post: @first_post, author: @first_user)
  end

  it 'should display post title' do
    visit user_post_path(@first_post, @first_user)
    expect(page).to have_content @first_post.title
  end

  it 'should display post body' do
    visit user_post_path(@second_post, @second_user)
    expect(page).to have_content @second_post.text[0..150]
  end

  it 'should display post author' do
    visit user_post_path(@first_post, @first_user)
    expect(page).to have_content @first_post.author.name
  end

  it 'should display comments count' do
    visit user_post_path(@first_post, @first_user)
    expect(page).to have_content("Comments: #{@first_post.comments_counter}")
  end

  it 'should display likes count' do
    visit user_post_path(@second_post, @second_user)
    expect(page).to have_content("Likes: #{@second_post.likes_counter}")
  end

  it 'should display commenters name' do
    visit user_post_path(@second_post, @second_user)
    @second_post.comments.each do |comment|
      expect(page).to have_content comment.author.name
    end
  end

  it 'should display comment' do
    visit user_post_path(@second_post, @second_user)
    @second_post.comments.each do |comment|
      expect(page).to have_content comment.text
    end
  end
end