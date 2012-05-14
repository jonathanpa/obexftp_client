module ObexftpClient
  class Ui

    def initialize(device)
      @client = Client.new(device)
      @stop   = false
    end

    def run
      puts "Connecting ..."
      list
      puts_prompt
      while ! @stop do
        command_line = STDIN.gets
        parse_input(command_line)
        puts_prompt
      end
    end

    def parse_input(command_line)
      matchdata = command_line.match('(\w+) "([\w+\.?\s?]+)"')
      
      if matchdata != nil
        command  = matchdata[1]
        argument = matchdata[2]

        case command
        when "cd" then
          cd(argument)
        when "download" then
          download(argument)
        else
          puts "Unknown command"
        end

      else

        matchdata = command_line.match('(\w+)')
        command   = matchdata[1]

        case command
        when "ls" then
          list
        when "download_all" then
          download_all
        when "stop" then
          @stop = true
        else
          puts "Unknown command"
        end
      end
    end

    def cd(path)
      @client.cd(path)
    end

    def list
      puts_list @client.list
    end

    def download(filename)
      puts @client.download(filename)
    end

    def download_all
      file_list = @client.list[:file_list]

      file_list.each do |node|
        download(node["name"])
      end
    end

    def puts_list(list)
      folder_list = list[:folder_list]
      file_list   = list[:file_list]

      folder_list.each do |node|
        puts "R-   #{node["name"]}"
      end

      file_list.each do |node|
        puts "F-   #{node["name"]}"
      end
    end

    def puts_prompt
      puts "#{@client.path} >"
    end

  end
end
