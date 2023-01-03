require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Zachariah Kolacki',
                              photo: 'https://xsgames.co/randomusers/assets/avatars/male/54.jpg',
                              bio: 'Baker from Poland.')
    @second_user = User.create(name: 'Criselda Xander',
                               photo: 'https://xsgames.co/randomusers/assets/avatars/female/21.jpg',
                               bio: 'Actress from Italy.')

    @first_post = Post.create(author: @first_user, title: 'Hello',
                              text: 'Contrary to popular belief, Lorem Ipsum is not simply random text.')
    @second_post = Post.create(author: @second_user, title: 'Hello 1',
                               text: 'The point of using Lorem Ipsum is that it has a more-or-less normal distribution')

    Comment.create(post: @first_post, author: @second_user, text: 'Hi!')
    Comment.create(post: @second_post, author: @first_user, text: 'Hi Criselda, Your first article is awesome!')
    Comment.create(post: @first_post, author: @first_user, text: 'Another wonderful blog!')

    Like.create(post: @first_post, author: @second_user)
    Like.create(post: @first_post, author: @first_user)
  end

  it 'should display user profile picture' do
    visit user_path(@first_user)
    expect(page).to have_css("img[src*='#{@first_user.photo}']")
  end

  it 'should display username' do
    visit user_path(@first_user)
    expect(page).to have_content @first_user.name
  end

  it 'should display number of posts' do
    visit user_path(@first_user)
    expect(page).to have_content "Number of posts: #{@first_user.posts_counter}"
  end

  it 'should display user bio.' do
    visit user_path(@first_user)
    expect(page).to have_content(@first_user.bio)
  end

  it 'should display first 3 posts' do
    visit user_path(@first_user)
    @posts = @first_user.posts
    @posts.each do |post|
      expect(page).to have_content(post.text[0..150])
    end
  end

  it 'should display button to view all posts' do
    visit user_path(@first_user)
    expect(page).to have_content('See all posts')
  end

  it 'button should redirect to post show page' do
    visit user_path(@second_user)
    find("#post-#{@second_post.id}").click
    expect(current_path).to match user_posts_path(@second_post)
  end

  it 'button should redirect to posts index page' do
    visit user_path(@first_user)
    click_link 'See all posts'
    expect(page).to have_current_path user_posts_path(@first_user)
  end
end
