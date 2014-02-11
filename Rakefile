require 'rake'

def log(message)
  puts with_color("\n######### #{message} #########", 93)
end

def with_color(message, colorcode)
  "\033[#{colorcode}m#{message}\033[0m"
end

def inst_message(arg, add_m)
  "Installing #{arg} #{add_m}".strip
end

def argument_handler(def_args, opt_arg, creation_args, orig_m, add_m = '')
  args = [def_args]
  if opt_arg
    log(inst_message(opt_arg, add_m))
    args << opt_arg
  else
    log(inst_message(orig_m, add_m))
  end
  Linker.new(*args).create_from(*creation_args)
end

desc "manages all submodules"
task :submodules do
  log('Updating submodules')
  system 'git submodule update --init --recursive'
end

desc "installs plugins in your ~/.janus directory"
task :plugins, :sel do |t, args|
  argument_handler('.janus', args['sel'], [t.to_s, false], t.to_s, 'to janus')
end

desc "installs dot files and directories in home directory"
task :dots, :sel do |t, args|
  argument_handler('', args['sel'], ['.'], 'Dotfiles')
end

desc "installs snippets in the snippets directory"
task :snippets do
  log('Using custom snippets')
  snip_dir = '.vim/janus/vim/tools/vim-snippets'
  Linker.new("#{snip_dir}/UltiSnips").create_from("snippets/ultisnips")
end

desc "updates the fonts cache"
task :fonts do
  log('Updating font cache')
  exec 'fc-cache -vf ~/.fonts'
end

desc 'compiles several ressources'
task :compile do
  log('Compiling YouCompleteMe')
  Dir.chdir('plugins/YouCompleteMe') do
    exec './install.sh'
  end
end

task default: [:submodules, :dots, :plugins, :snippets, :fonts ]

class Linker
  def initialize(path = "", selector = '*', exclusions = %w{ install.sh Rakefile README.md })
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
        next if @exclusions.include?(file) || (no_dir && non_linkable_directory(file))
        create_links(file)
      end
    end
  end

  def non_linkable_directory(file)
    File.directory?(file) if non_linkable.include?(file)
  end

  def non_linkable
    %w{ plugins snippets }
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
