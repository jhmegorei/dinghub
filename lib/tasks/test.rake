namespace :test do
  desc "Setup Test Database"
  task setup_test_db: :environment do
    unless Dir.exists?(Rails.root.join("db", "neo4j", "test"))
      Rake::Task["neo4j:install"].invoke("community-2.1.5","test")
      Rake::Task["neo4j:config"].invoke("test","7475")
    end
  end

  desc "clean test db"
  task clean_test_db: :environment do
    puts "Cleaning Neo4j test database"
    Rake::Task["neo4j:reset_yes_i_am_sure"].invoke("test")
  end
end