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
      
    end
    
    def download(filename)
      
    end
    
    def download_all
      
    end
    
  end
end