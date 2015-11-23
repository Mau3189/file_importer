require 'zip'

class FileManager
  def initialize(file)
    @file = file
  end

  def unzip_csv(new_filename)
    Zip::File.open(@file.path) do |unzip_files|
      unzip_files.each do |unzip_file|
        unzip_file.extract(File.join('/tmp', "#{new_filename}.csv"))
      end
    end
  end
end
