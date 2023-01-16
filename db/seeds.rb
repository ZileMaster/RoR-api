# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admins = Admin.create(username: "admin", password_digest: "password", email: "admin@example.com", first_name: "John", last_name: "Doe")

5.times do |i|
    User.create(username: "user#{i}", password_digest: "password", email: "user#{i}@example.com", first_name: "First#{i}", last_name: "Last#{i}", admin_id: admins.id)
  end

projectPage = ProjectPage.create(admin_id: admins.id);
personalPage = PersonalBlog.create(admin_id: admins.id);
travelPage = TravelBlog.create(admin_id: admins.id);

noticeBoard = NoticeBoard.create(admin_id: admins.id);

5.times do |i|
    Info.create(head: "this is the head #{i}", description: "the description of the info number #{i}", notice_board_id: noticeBoard.id)
  end

3.times do |i|
    Post.create(headline:"this is the head #{i}", description: "the description of the info number #{i}", topic: "project", travel_blog_id: travelPage.id, personal_blog_id: personalPage.id, project_page_id: projectPage.id, likes: 0);
end

3.times do |i|
    Post.create(headline:"this is the head #{i}", description: "the description of the info number #{i}", topic: "travel", travel_blog_id: travelPage.id, personal_blog_id: personalPage.id, project_page_id: projectPage.id, likes: 0);
end

3.times do |i|
    Post.create(headline:"this is the head #{i}", description: "the description of the info number #{i}", topic: "personal", travel_blog_id: travelPage.id, personal_blog_id: personalPage.id, project_page_id: projectPage.id, likes: 0);
end

3.times do |i|
    Komentar.create(headline:"this is the head #{i}", description: "the description of the info number #{i}", user_id: User.id, post_id:Post.id, rating: 0)
end

news = Newsletter.create(user_id: User.id);