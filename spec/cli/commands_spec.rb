require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Ti Generator Commands" do
  context "Info command:" do
    context "ti info" do
      it "should display the version" do
        Ti::CLI.start(['info'])
      end
    end
  end
end