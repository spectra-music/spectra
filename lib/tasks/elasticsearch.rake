#require 'elasticsearch/rails/tasks/import'
require 'elasticsearch/extensions/test/cluster/tasks'

# namespace :es do
#   task :setup do
#     system('rake environment elasticsearch:import:model CLASS="Artist"')
#     system('rake environment elasticsearch:import:model CLASS="Track"')
#     system('rake environment elasticsearch:import:model CLASS="Album"')
#   end
# end