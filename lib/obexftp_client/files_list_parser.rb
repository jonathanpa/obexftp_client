module ObexftpClient
  class FilesListParser

    def self.parse_ls(obexftp_ls_result, type)
      doc = Nokogiri::XML(obexftp_ls_result)

      case type
      when :file then
        return doc.xpath("//file")
      when :folder then
        return doc.xpath("//folder")
      else
        return []
      end
    end
  end
end
