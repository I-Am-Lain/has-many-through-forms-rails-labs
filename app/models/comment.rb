class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def user_attributes=(user_attrs)
    user_attrs.values.each do |v|
      if v != ""
        user = User.find_or_create_by(username: v)
        self.user = user
      end
    end
  end

end
