module ObexftpClient
	class Command
    
    def self.run(command)
      return %x(#{command})
    end
    
	end
end
