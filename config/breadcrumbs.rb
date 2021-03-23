crumb :root do
  link "Dashboard", root_path
end

#Artist List
crumb :artists do
  link "All Artists", artists_path
end

#Artist
crumb :artist do |artist|
  link artist.name, artist
  parent :artists
end

crumb :edit_artist do |artist|
  link "Editing #{artist.name}", artist
  parent :artist, artist
end

crumb :new_artist do
  link "Creating New Artist"
  parent :artists
end

#Photocard List
crumb :photocards do
  link "All Photocards", photocards_path
end

crumb :photocard do |photocard|
    link photocard.title, photocard
    if include_artist_path
    parent photocard.artist
    else
      parent :photocards
    end
end

crumb :edit_photocard do |photocard|
  link "Editing #{photocard.title}", photocard
  parent :photocard, photocard
end

crumb :new_photocard do
  link "Creating New photocard"
  parent :photocards
end


#Post List
crumb :posts do |user|
  if include_user_path
    link "Posts by Selected User"
    parent :community
  else
  link "All Posts", posts_path
  end
end

crumb :post do |post|
  link post.title, post
  parent :posts
end


crumb :edit_post do |post|
  link "Editing #{post.title}", post
  parent :post, post
end

# crumb :new_photocard do
#   link "Creating New photocard"
#   parent :photocards
# end

crumb :comments do |post|
  if include_post_path
    link post.title, post
    link "All Comments for #{post.title}"
    parent :posts
  else
    parent :posts
  end
end

crumb :community do
  link "Community", community_path
  parent :root
end


# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).