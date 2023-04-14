# app/helpers/posts_helper.rb

module PostsHelper
  def first_lines(str, num_lines = 1)
    str.lines.first(num_lines).join
  end
end
