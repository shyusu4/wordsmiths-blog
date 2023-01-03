require 'rails_helper'

RSpec.describe 'Post index', type: :feature do
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
    visit user_posts_path(@first_user)
    expect(page).to have_css("img[src*='#{@first_user.photo}']")
  end

  it 'should display username' do
    visit user_posts_path(@first_user)
    expect(page).to have_content @first_user.name
  end

  it 'should display number of posts' do
    visit user_posts_path(@first_user)
    expect(page).to have_content "Number of posts: #{@first_user.posts_counter}"
  end

  it 'should display first comments' do
    visit user_posts_path(@first_user)
    @first_post.recent_comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end

  it 'should display number of comments' do
    visit user_posts_path(@second_user)
    expect(page).to have_content("Comments: #{@second_post.comments_counter}")
  end

  it 'should display number of likes' do
    visit user_posts_path(@first_user)
    expect(page).to have_content("Likes: #{@first_post.likes_counter}")
  end

  it 'should display post title' do
    visit user_posts_path(@first_user)
    expect(page).to have_content @first_post.title
  end

  it 'should display post body' do
    visit user_posts_path(@second_user)
    expect(page).to have_content @second_post.text[0..150]
  end
  
  it 'should redirect to post show page' do
    visit user_posts_path(@first_user)
    click_link(@first_post.title)
    expect(current_path).to match user_posts_path(@first_user.id, @first_post.id)
  end

  it 'should show a section for pagination' do
    visit user_posts_path(@first_user)
    expect(page).to have_content('Pagination')
  end
end
