require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Ti Generator Commands" do
  context "Help command:" do
    context "ti help" do
      it "should display the basic help for the CLI" do
        response, status = capture_with_status(:stdout){ Ti::CLI.start(['-help']) }
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
end