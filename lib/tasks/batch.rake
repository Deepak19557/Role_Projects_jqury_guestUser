namespace :batch do
  desc "TODO"
  task delete_guest: :environment do
    puts 'success'
    @user  = User.where(role: "Guest")
    @user.destroy_all
  end

end
