module ObexftpClient
  class Client
    attr_reader :path,
                :device

    def initialize(device_to_scan)
      @device = device_to_scan
      @path ="/"
    end

    def cd(path)
      if path[0] == "/"
        @path = path
      else
        if @path[@path.length - 1] == "/"
          @path += path
        else
          @path += "/" + path
        end
      end
    end

    def list
      raw_list = Command.run(%{obexftp -b #{@device} -l "#{@path}"})
      folder_list = FilesListParser.parse_ls(raw_list, :folder)
      file_list = FilesListParser.parse_ls(raw_list, :file)

      return {:folder_list => folder_list, :file_list => file_list}
    end

    def download(filename)
      return Command.run(%{obexftp -b #{@device} -c "#{@path}" -g "#{filename}"})
    end
  end
end
