require 'pry'

class Rename

  NEW_NAME = ARGV[0]
  OLD_NAME = 'Boilerplate'

  def self.rename_entries(directory)
    paths = paths_for_entries(directory)
    paths.each do |path|
      is_directory = File.directory?(path)
      # future-proof against symlinks
      is_sym_link = File.symlink?(path)
      if !is_sym_link
        if is_directory
          Rename.rename_entries(path)
        else
          Rename.find_and_replace_content(path)
        end
      end
    end
  end

  # Returns paths relative to the app directory
  def self.paths_for_entries(directory) 
    entries = Dir.entries(directory).select do |entry|
      entry != '.' && entry != '..' && entry[0] != '.'
    end
    entries.map do |entry|
      "#{directory}/#{entry}"
    end
  end

  def self.find_and_replace_content(entry)
    file = File.open(entry,"r+") 
    content = file.read
    if content.include?(OLD_NAME)
      new_content = content.gsub(OLD_NAME,NEW_NAME)
      file = File.open(entry,"w+") 
      file.write(new_content)
      file.close
    end
  end

end

Rename.rename_entries(Dir.getwd)
