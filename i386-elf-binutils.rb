require 'formula'

class I386ElfBinutils < Formula
  homepage 'http://gcc.gnu.org'
  url 'http://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.gz'
  sha256 '26253bf0f360ceeba1d9ab6965c57c6a48a01a8343382130d1ed47c468a3094f'

  depends_on 'gcc49' => :build

  def install
    ENV['CC'] = '/usr/local/bin/gcc-4.9'
    ENV['CXX'] = '/usr/local/bin/g++-4.9'
    ENV['CPP'] = '/usr/local/bin/cpp-4.9'
    ENV['LD'] = '/usr/local/bin/gcc-4.9'

    mkdir 'build' do
      system '../configure', '--disable-nls', '--target=i386-elf',
                             '--disable-werror',
                             '--enable-gold=yes',
                             "--prefix=#{prefix}"
      system 'make all'
      system 'make install'
      FileUtils.mv lib, libexec
    end
  end

end
