# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Zachariah Kolacki', photo: 'https://xsgames.co/randomusers/assets/avatars/male/54.jpg', bio: 'Baker from Poland.', email: 'sycherrysoda@gmail.com', password: '1234567', password_confirmation: '1234567', role: 'admin')
second_user = User.create(name: 'Criselda Xander', photo: 'https://xsgames.co/randomusers/assets/avatars/female/21.jpg', bio: 'Actress from Italy.', email: 'mgemmons@gmail.com', password: '1234567', password_confirmation: '1234567', role: 'user')
third_user = User.create(name: 'Kieth Cubert', photo: 'https://xsgames.co/randomusers/assets/avatars/male/73.jpg', bio: 'Developer from Greece', email: 'microfab@hotmail.com', password: '1234567', password_confirmation: '1234567', role: 'user')
fourth_user = User.create(name: 'Amos Zarzycki', photo: 'https://xsgames.co/randomusers/assets/avatars/male/76.jpg', bio: 'Accountant from the UK', email: 'andrewik@comcast.net', password: '1234567', password_confirmation: '1234567', role: 'user')

first_post = Post.create(author: first_user, title: 'Hello', text: 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.')
second_post = Post.create(author: second_user, title: 'Hello 1', text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).')
third_post = Post.create(author: second_user, title: 'Hello 2', text: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.')
fourth_post = Post.create(author: second_user, title: 'Hello 3', text: 'here are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.')

Comment.create(post: first_post, author: second_user, text: 'Hi, great post!')
Comment.create(post: second_post, author: first_user, text: 'This is awesome!')
Comment.create(post: fourth_post, author: second_user, text: 'Amazing!')
Comment.create(post: first_post, author: first_user, text: 'Another wonderful post!')
Comment.create(post: first_post, author: first_user, text: 'Keep it Up!')
Comment.create(post: fourth_post, author: second_user, text: 'Wonderful!')
Comment.create(post: first_post, author: second_user, text: 'Hey')
Comment.create(post: second_post, author: first_user, text: 'Keep it Up!')
Comment.create(post: fourth_post, author: second_user, text: 'This is awesome!')
Comment.create(post: first_post, author: first_user, text: 'Another wonderful post!')
Comment.create(post: first_post, author: first_user, text: 'Cool')
Comment.create(post: fourth_post, author: second_user, text: 'Wonderful!')
Comment.create(post: first_post, author: second_user, text: 'Hi!')
Comment.create(post: second_post, author: first_user, text: 'I like it!')
Comment.create(post: fourth_post, author: second_user, text: 'Totally agree')
Comment.create(post: first_post, author: first_user, text: 'Tbh, I dont think thats the case')
Comment.create(post: first_post, author: first_user, text: 'Keep it Up!')
Comment.create(post: fourth_post, author: second_user, text: 'Wonderful!')

Like.create(post: first_post, author: second_user)
Like.create(post: first_post, author: first_user)
Like.create(post: first_post, author: first_user)
Like.create(post: fourth_post, author: second_user)
Like.create(post: third_post, author: second_user)
Like.create(post: second_post, author: first_user)
Like.create(post: fourth_post, author: second_user)
Like.create(post: fourth_post, author: second_user)