namespace :batch do
  desc "TODO"
  task delete_guest: :environment do
    puts 'hello'
    @user  = User.where(role: "Guest")
    @user.destroy_all
  end

end
