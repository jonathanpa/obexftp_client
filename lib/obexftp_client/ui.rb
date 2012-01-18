module ObexftpClient
	class Ui
    
    def initialize
      @client = Client.new
      @stop = false
    end
    
    def run
      puts "Connecting ..."
      list
      puts_prompt
      while ! @stop do
        command_line = gets
        parse_input(command)
        puts_prompt
      end
      
    end
    
    def parse_input(command_line)
      command = command_line[/(\w+), (\w+)/, 1]
      argument = command_line[/(\w+), (\w+)/, 2]
      case command
      when "cd" then
        cd(argument)
        puts_prompt
      when "ls" then
        list
      when "download" then
        download(argument)
      when "download_all" then
        download_all
      when "stop" then
        @stop = true
      end
    end
    
    def cd(path)
      @client.cd(path)
    end
    
    def list
      puts @client.list
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
      file_list = list[:file_list]
      
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