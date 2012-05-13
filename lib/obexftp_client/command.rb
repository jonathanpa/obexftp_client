module ObexftpClient
  class Command

    def self.run(command)
      omg! command
      return %x(#{command})
    end

  end
end
