require 'wlog/commands/commandable'
require 'wlog/domain/static_configurations'

module Wlog
# To check if template dir exists or not. Make dirs. Add sample template.
# @author Simon Symeonidis
class BootstrapTemplates < Commandable
  include StaticConfigurations

  def initialize
  end

  def execute
    unless File.exists? TemplateDir
      FileUtils.mkdir_p TemplateDir
    end

    unless File.exists? TemplateSampleFile
      write_default_template!
    end
  end

private

  # Write a default template 
  def write_default_template!
    fh = File.open(TemplateSampleFile, 'w')
    data = <<TEMPLATE
A list of issues:
<% @issues.each do |issue| %>
  <%= issue.id + " " + issue.description %>
<% end %>
TEMPLATE
    fh.write(data)
    fh.close
  nil end

end
end
