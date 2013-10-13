desc "Import avatars from a user's gravatar url"
task :import_avatars => :environment do 
	puts "Importing avatars form gravatar"
	User.get_gravatars
	puts "Avatars updated."
end