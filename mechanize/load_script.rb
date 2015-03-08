require 'rubygems'
require 'mechanize'

base_address = ARGV[0]

agent = Mechanize.new
agent.get(base_address)

# Generate some load
loop do
  agent.current_page.link_with(:text => "New Post").click
  form = agent.current_page.forms.first
  form["post[title]"] = rand(36**10).to_s(36)
  form["post[body]"] = rand(36**150).to_s(36)
  form.submit

  agent.current_page.link_with(:text => "Back").click
end
