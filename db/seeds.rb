# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admins = Admin.create(username: "az_zile01", password_digest: "password1", email: "aleksaa.zivkovic01@gmail.com", first_name: "Aleksa", last_name: "Zivkovic")


User.create(
    username: "example_username",
    password: "12345678",
    email: "example_user@example.com",
    first_name: "Example",
    last_name: "User",
    admin_id: 1
  )
  
projectPage = ProjectPage.create(admin_id: admins.id);
personalPage = PersonalBlog.create(admin_id: admins.id);
travelPage = TravelBlog.create(admin_id: admins.id);

noticeBoard = NoticeBoard.create(admin_id: admins.id);

5.times do |i|
    Info.create(head: "this is the head #{i}", description: "the description of the info number #{i}", notice_board_id: noticeBoard.id)
  end

3.times do |i|
    Post.create(headline:"this is the head #{i}", description: "the description of the info number #{i}", text: "sample text for the post, it should be very veryv very big but this is just a seed so it's lil", topic: "project", travel_blog_id: travelPage.id, personal_blog_id: personalPage.id, project_page_id: projectPage.id, likes: 0);
end

3.times do |i|
    Post.create(headline:"this is the head #{i}", description: "the description of the info number #{i}", text: "sample text for the post, it should be very veryv very big but this is just a seed so it's lil" , topic: "travel", travel_blog_id: travelPage.id, personal_blog_id: personalPage.id, project_page_id: projectPage.id, likes: 0);
end

3.times do |i|
    Post.create(headline:"this is the head #{i}", description: "the description of the info number #{i}", topic: "personal", text: "sample text for the post, it should be very veryv very big but this is just a seed so it's lil" , travel_blog_id: travelPage.id, personal_blog_id: personalPage.id, project_page_id: projectPage.id, likes: 0);
end

3.times do |i|
    Komentar.create(headline:"this is the head #{i}", description: "the description of the info number #{i}", user_id: 1, post_id:i, rating: 0)
end

news = Newsletter.create(user_id: User.id);