begin
  require "amazing_print"
  AmazingPrint.pry!
rescue LoadError
  require "awesome_print"
  AwesomePrint.pry!
end

Pry.config.pager = false

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end
