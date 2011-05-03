require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Ti Generator Commands" do
  context "Help command:" do
    context "ti help" do
      it "should display the basic help for the CLI" do
        response, status = capture_with_status(:stdout){ Ti::CLI.start(['help']) }
        status.should eql(Ti::CLI::STATUS_TYPES[:success])
      end
    end
    context "ti help invalid_task" do
      it "should display appropriate error message" do
        response, status = capture_with_status(:stderr){ Ti::CLI.start(['help', 'blah']) }
        response.should eql("Could not find task \"blah\".\n")
        status.should eql(Ti::CLI::STATUS_TYPES[:success])
      end
    end
  end
  context "Info command:" do
    context "ti info" do
      it "should display the version" do
        response, status = capture_with_status(:stdout){ Ti::CLI.start(['info']) }
        response.should eql("version: 0.2.0\n")
        status.should eql(Ti::CLI::STATUS_TYPES[:success])
      end
    end
    context "ti -v (alias)" do
      it "should display the version" do
        response, status = capture_with_status(:stdout){ Ti::CLI.start(['-v']) }
        response.should eql("version: 0.2.0\n")
        status.should eql(Ti::CLI::STATUS_TYPES[:success])
      end
    end
    context "ti --version (alias)" do
      it "should display the version" do
        response, status = capture_with_status(:stdout){ Ti::CLI.start(['--version']) }
        response.should eql("version: 0.2.0\n")
        status.should eql(Ti::CLI::STATUS_TYPES[:success])
      end
    end
  end
  context "New command: " do
    context "Help (ti help new)" do
      it "should display help for the task 'new'" do
        response, status = capture_with_status(:stdout){ Ti::CLI.start(['help', 'new']) }
        status.should eql(Ti::CLI::STATUS_TYPES[:success])
      end
    end
    context "Generate a new project: " do
      context "with defaults (ti new)" do
        it "should generate new project \"HelloWorld\"" do
          response, status = capture_with_status(:stdout){ Ti::CLI.start(['new']) }
          response.should eql("\e[1m\e[32mRemoving README file.\e[0m\e[0m\n\e[1m\e[32mRemoving Resources directory.\e[0m\e[0m\n\e[1m\e[32mCreating the Resources directory.\e[0m\e[0m\n\e[1m\e[32mCreating the src directory.\e[0m\e[0m\n\e[1m\e[32mCreating the docs directory.\e[0m\e[0m\n\e[1m\e[32mCreating the specs directory.\e[0m\e[0m\n\e[1m\e[32mCreating the Resources/images directory.\e[0m\e[0m\n\e[1m\e[32mCreating the Resources/stylesheets directory.\e[0m\e[0m\n\e[1m\e[32mCreating the Resources/vendor directory.\e[0m\e[0m\n\e[1m\e[32mCreating Readme.mkd file.\e[0m\e[0m\n\e[1m\e[32mCreating src/app.coffee\e[0m\e[0m\n\e[1m\e[32mCreating .gitignore\e[0m\e[0m\n\e[1m\e[32mCreating config.rb\e[0m\e[0m\n\e[1m\e[32mCreating Rakefile\e[0m\e[0m\n\e[1m\e[32mCreating Guardfile\e[0m\e[0m\n\e[1m\e[32mYour Titanium project is ready for you to get rockin!\e[0m\e[0m\n")
          status.should eql(Ti::CLI::STATUS_TYPES[:success])
        end
        after (:all) do
          remove_directories("HelloWorld")
        end
      end
      context "with name Demo (ti new Demo)" do
        it "should generate new project \"Demo\"" do
          response, status = capture_with_status(:stdout){ Ti::CLI.start(['new', 'Demo']) }
          response.should eql("\e[1m\e[32mRemoving README file.\e[0m\e[0m\n\e[1m\e[32mRemoving Resources directory.\e[0m\e[0m\n\e[1m\e[32mCreating the Resources directory.\e[0m\e[0m\n\e[1m\e[32mCreating the src directory.\e[0m\e[0m\n\e[1m\e[32mCreating the docs directory.\e[0m\e[0m\n\e[1m\e[32mCreating the specs directory.\e[0m\e[0m\n\e[1m\e[32mCreating the Resources/images directory.\e[0m\e[0m\n\e[1m\e[32mCreating the Resources/stylesheets directory.\e[0m\e[0m\n\e[1m\e[32mCreating the Resources/vendor directory.\e[0m\e[0m\n\e[1m\e[32mCreating Readme.mkd file.\e[0m\e[0m\n\e[1m\e[32mCreating src/app.coffee\e[0m\e[0m\n\e[1m\e[32mCreating .gitignore\e[0m\e[0m\n\e[1m\e[32mCreating config.rb\e[0m\e[0m\n\e[1m\e[32mCreating Rakefile\e[0m\e[0m\n\e[1m\e[32mCreating Guardfile\e[0m\e[0m\n\e[1m\e[32mYour Titanium project is ready for you to get rockin!\e[0m\e[0m\n")
          status.should eql(Ti::CLI::STATUS_TYPES[:success])
        end
        after (:all) do
          remove_directories("Demo")
        end
      end
    end
  end
end