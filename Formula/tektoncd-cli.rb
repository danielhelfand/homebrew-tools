# This file was generated by GoReleaser. DO NOT EDIT.
class TektoncdCli < Formula
  desc "A CLI for interacting with Tekton!"
  homepage "https://github.com/tektoncd/cli"
  version "0.1.1"

  if OS.mac?
    url "https://github.com/tektoncd/cli/releases/download/v0.1.1/tkn_0.1.1_Darwin_x86_64.tar.gz"
    sha256 "4fef4fd22b8973c179b333033f5d007ed290fc77a470dec6012994e73a9998d1"
  elsif OS.linux?
    url "https://github.com/tektoncd/cli/releases/download/v0.1.1/tkn_0.1.1_Linux_x86_64.tar.gz"
    sha256 "35565824f32e1603d2665018097568037f44266aa0c1626c105441ba60e2dc8c"
  end

  def install
    bin.install "tkn" => "tkn"
    
    output = Utils.popen_read("SHELL=bash #{bin}/tkn completion bash")
    (bash_completion/"tkn").write output
    
    output = Utils.popen_read("SHELL=zsh #{bin}/tkn completion zsh")
    (zsh_completion/"_tkn).write output
    
    prefix.install_metafiles
  end

  test do
    system "#{bin}/tkn --version"
  end
end
