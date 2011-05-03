require File.expand_path(File.join(File.dirname(__FILE__), %w[ .. lib ti ]))

require 'thor'

PROGRAM_VERSION = "0.2.0"

module Ti
  class CLI < Thor

    # info
    map %w(--version -v) => 'info'
    desc "info", "information about the Titanium CLI"
    def info
      say "version: #{PROGRAM_VERSION}"
    end

    # new
    desc "new <name> <id> <platform>", "generates a new Titanium project."
    long_desc "Generates a new Titanium project. See 'ti help project:new for more information.
              \n\nExamples:
              \n\nti new   ==> Creates a project with defaults, name as 'HelloWorld', id as 'org.company.demo' and platform as 'iphone'.
              \n\nti new 'Demo', 'com.mycompany.demo'  ==> Creates a project with name and id as specified, and defaults to platform 'iphone'.
              \n\nti new 'Demo', 'com.mycompany.demo', ipad  ==> Creates a project with name, id and platform as specified."
    def new(name='HelloWorld', id='org.company.demo', platform='iphone')
      # Generate the Ti application
      Ti::Generate.new_project(name, id, platform)
    end

  end
end