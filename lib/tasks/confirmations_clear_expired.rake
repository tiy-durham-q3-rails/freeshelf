namespace :confirmations do
  desc 'Rake task to clear expired email confirmations and unactivated accounts'
  task :clear_expired => :environment do
    ActiveRecord::Base.connection

    all_confirms = EmailConfirmation.all

    all_confirms.each do |confirm|
      if confirm.expires_at < DateTime.now
        user = User.find(confirm.user_id)
        puts "Destroyed #{user.name}'s Inactive account'"
        user.destroy
        confirm.destroy
      end
    end
  end
end
