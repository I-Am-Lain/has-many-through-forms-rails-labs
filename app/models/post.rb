class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  #accepts_nested_attributes_for :categories

  def categories_attributes=(category_attrs)
    category_attrs.values.each do |v|
      if v[:name] != ""
        cat = Category.find_or_create_by(v)
        self.categories << cat
      end
    end
  end

  # def users_attributes=(user_attrs)
  #   user_attrs.values.each do |v|
  #     if v[:username] != ""
  #       user = User.find_or_create_by(v)
  #       self.users << user
  #     end
  #   end
  # end

  # def comments_attributes=(comment_attrs)
  #   comment_attrs.values.each do |v|
  #     if v[:content] != ""
  #       comm = Comment.find_or_create_by(v)
  #       self.comments << comm
  #     end
  #   end
  # end

  def unique_visitors
    self.comments.map do |c|
      c.user
    end.uniq
  end


end
