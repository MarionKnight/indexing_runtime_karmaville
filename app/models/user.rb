class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :user_total_karma

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
    # returns all the users with their karma total, sorted by karma total

    # joins(:karma_points).group('users.id')
    # joins(:karma_points).group('users.id').order('SUM(karma_points.value) DESC')

    # In progress:
    self.order('users.user_total_karma DESC')


  end

  def total_karma
    self.karma_points.sum(:value)

    # assumption: each time a new karma_point is added, have
    # # to update both tables: user table to increment the sum
    # # karma and also karma_point table to create that entry

    # either get the value from the user table or update it
    # if self.user_karma_points == 0
    #   self.update_attribute() == self.karma_points.sum(:value)
    #   return the value
    # else
    #   return the value
    # end
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
