class ProjectCreator
  attr_reader(:root_dir_input, :initial_rb_input, :more_rb_input)
 
  def initialize()
    @root_dir_input
    @initial_rb_input
    @more_rb_input
  end

  def project_creator()
    puts 'Please Enter the Name for Your Project\'s Root Directory:'
    @root_dir_input = gets.chomp
    Dir.mkdir("../#{@root_dir_input}")
    Dir.mkdir("../#{@root_dir_input}/lib")
    Dir.mkdir("../#{@root_dir_input}/spec")
    File.write("../#{@root_dir_input}/Gemfile", "source 'https://rubygems.org'\ngem 'rspec'\ngem 'pry'")
  end

  def file_creator()
    puts'Please Enter the Name for Your Project\'s logic, spec, and script Files:'
    @initial_rb_input = gets.chomp
    File.write("../#{@root_dir_input}/lib/#{@initial_rb_input}.rb", "class #{(@initial_rb_input.capitalize())}\nend")
    File.write("../#{@root_dir_input}/spec/#{@initial_rb_input}_spec.rb", "require('rspec')\nrequire('#{@initial_rb_input}')")
    File.write("../#{@root_dir_input}/#{@initial_rb_input}_script.rb", "#!/usr/bin/ruby\nrequire ('./lib/#{@initial_rb_input}')" )
  end

  def additional_class()
   response = "y"
   while (response == "y") do
    file_creator()
    puts 'Would you like to add more files(Y/N)' 
    response = gets.chomp.downcase()
    end
  end
end

