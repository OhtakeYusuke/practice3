crumb :root do
  link "投稿一覧", root_path
end

crumb :post_show do |post|
  link post.name, post_path(post)
  parent :root
end

crumb :post_edit do |post|
  link "編集", edit_post_path
  parent :post_show, post
end
