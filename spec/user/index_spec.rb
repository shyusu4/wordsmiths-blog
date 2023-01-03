require 'rails_helper'

RSpec.describe 'User index', type: :feature do
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
  it 'should display username' do
    visit users_path(@first_user)
    expect(page).to have_content @first_user.name
  end

  it 'should display users profile picture' do
    visit users_path(@first_user)
    expect(page).to have_css("img[src*='#{@first_user.photo}']")
  end

  it 'should display number of posts by given user' do
    visit users_path(@first_user)
    expect(page).to have_content('0 Posts')
    visit users_path(@second_user)
    expect(page).to have_content('0 Posts')
  end

  it 'should redirect to user show page' do
    visit users_path(@first_user)
    click_link @first_user.name.to_s
    expect(current_path).to eq user_path(@first_user)
  end
end
