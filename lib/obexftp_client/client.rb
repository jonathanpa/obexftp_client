module ObexftpClient
	class Client
    attr_reader :path 
    
    def initialize
      @path="/"
    end
    
    def cd(path)
      if path.first == "/"
        @path = path
      else
        if @path.last == "/"
          @path += path
        else
          @path += "/" + path
        end
      end
    end
    
    def list
      raw_list = Command.run(%{obexftp -b -l "#{@path}"})
      folder_list = FilesListParser.parse_ls(raw_list, :folder)
      file_list = FilesListParser.parse_ls(raw_list, :file)
      
      return {:folder_list => folder_list, :file_list => file_list}
      
    end
    
    def download(filename)
      return Command.run(%{obexftp -b -c "#{@path}" -g "#{filename}"})
    end
  end
end