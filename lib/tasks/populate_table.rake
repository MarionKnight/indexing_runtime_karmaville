namespace :user_table do
  desc "Populate the users table with total karma"
  task :populate => :environment do
    time = Time.now
    counter = 0
    User.all.each do |user|
      karma = KarmaPoint.where(user_id: user.id).sum(:value)
      user.update_attribute(:user_total_karma, karma)

      # user.update_attributes(user_total_karma: karma)

      counter += 1
      if counter % 10 == 0
        p Time.now - time
        time = Time.now
      end
    end
  end

end