Rake::Task["railties:install:migrations"].clear
namespace :railties do
  namespace :install do
    # desc "Copy missing migrations from Railties (e.g. engines). You can specify Railties to use with FROM=railtie1,railtie2"
    task migrations: :'db:load_config' do
      to_load = ENV["FROM"].blank? ? :all : ENV["FROM"].split(",").map(&:strip)
      railties = {}
      Rails.application.migration_railties.each do |railtie|
        next unless to_load == :all || to_load.include?(railtie.railtie_name)


        if railtie.respond_to?(:paths) && (path = railtie.paths["db/migrate"].first)
          railties[railtie.railtie_name] = path
        end

        unless ENV["MIGRATIONS_PATH"].blank?
          railties[railtie.railtie_name] = railtie.root + ENV["MIGRATIONS_PATH"]
        end
      end

      on_skip = Proc.new do |name, migration|
        puts "NOTE: Migration #{migration.basename} from #{name} has been skipped. Migration with the same name already exists."
      end

      on_copy = Proc.new do |name, migration|
        puts "Copied migration #{migration.basename} from #{name}"
      end

      destination =
        if ENV["TO"]
          ActiveRecord::Tasks::DatabaseTasks.db_dir + "/#{ENV['TO']}"
        else
          ActiveRecord::Tasks::DatabaseTasks.migrations_paths.first
        end
      ActiveRecord::Migration.copy(destination, railties, on_skip: on_skip, on_copy: on_copy)
    end
  end
end
