# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "obexftp_client/version"

Gem::Specification.new do |s|
  s.name        = "obexftp_client"
  s.version     = ObexftpClient::VERSION
  s.authors     = ["Jonathan Pares"]
  s.email       = ["jonathan.pares@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Ruby obexftp client}
  s.description = %q{This gem uses the obexftp command to list/download files from/to bluetooth devices.}

  s.rubyforge_project = "obexftp_client"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  #s.add_development_dependency "omg"
  s.add_runtime_dependency "nokogiri"
end
