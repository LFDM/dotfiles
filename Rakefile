require 'rake'

desc "installs plugins in your ~/.janus directory"
task :plugins do
  puts "######### Installing plugins to janus #########"
  Linker.new(".janus/").create_from("plugins", false)
end

desc "installs dot files in home directory"
task :dots do
  puts "######### Installing Dotfiles #########"
  Linker.new.create_from(".")
end

desc "installs snippets in the snippets directory"
task :snippets do
  puts "######### Using custom snippets #########"
  Linker.new(".janus/vim-snippets/snippets/").create_from("snippets")
end

namespace :patches do
  desc "Patches SnipMate inside of janus. Triggered by <c-j> and don't overwriting the paste buffer"
  task :snipmate do
    puts "######### Applying Patches to SnipMate #########"

    snipmate_path = File.join(ENV["HOME"], ".vim/janus/vim/tools/snipmate")
    add_paths = { 1 => "after/plugin", 2 => "autoload" }
    Dir.chdir("#{Dir.pwd}/patches/snipmate") do
      Dir["*"].each do |file|
        path_helper = file.match(/.*(\d).*/)[1].to_i # patch files are called snipMate1.vim and snipMate2.vim
        full_path = File.join(snipmate_path, add_paths[path_helper])
        orig_file = "#{full_path}/snipMate.vim"

        puts "Removing #{orig_file}"
        system %Q{rm "#{orig_file}"}

        puts "linking to patch #{file}"
        system %Q{ln -s "#{Dir.pwd}/#{file}" "#{orig_file}"}
      end
    end
  end
end

task default: %i{ dots plugins snippets }

class Linker
  def initialize(path = "", selector = '*', exclusions = %w{ Rakefile })
    @path = File.join(ENV["HOME"], path)
    @selector = selector
    @exclusions = exclusions
    # dot dotfiles
    @prefix = (path.empty? ? "." : "")
  end

  def create_from(dir, no_dir = true)
    @replace_all = false
    Dir.chdir("#{Dir.pwd}/#{dir}") do
      Dir[@selector].each do |file|
        next if @exclusions.include?(file) || (no_dir && File.directory?(file))
        create_links(file)
      end
    end
  end

  def full_path(file)
    File.join(@path, file)
  end

  def create_links(file)
    file = "#{@prefix}#{file}"
    if File.exist?(full_path(file))
      if @replace_all
        replace_file(file)
      else
        print "overwrite #{full_path(file)}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          @replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping #{full_path(file)}"
        end
      end
    else
      link_file(file)
    end
  end

  def replace_file(file)
    system %Q{rm "#{full_path(file)}"}
    link_file(file)
  end

  def link_file(file)
    puts "linking #{full_path(file)}"
    unprefixed = file.sub(/^#{@prefix}/, "")
    system %Q{ln -s "#{Dir.pwd}/#{unprefixed}" "#{full_path(file)}"}
  end
end
