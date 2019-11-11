class Dvc < Formula
  include Language::Python::Virtualenv

  desc "Git for data science projects"
  homepage "https://dvc.org"
  url "https://github.com/iterative/dvc/archive/0.68.0.tar.gz"
  sha256 "8c584a6ad933f8560782244acb7eabaacdc83e7c6d718f9724487c2ebcdabcd8"

  depends_on "pkg-config" => :build
  depends_on "openssl"
  depends_on "python"

  # Patch from including brew build marker
  # https://github.com/iterative/dvc/pull/2773
  patch do
    url "https://raw.githubusercontent.com/iterative/homebrew-dvc/master/Formula/build.patch"
    sha256 "c4f57c9fbf28630bcd63301943a7a9634a6d93a334637db0e4a4c0143a800941"
  end
  
  def install
    venv = virtualenv_create(libexec)
    system libexec/"bin/pip", "install", ".[all]"
    # NOTE: dvc depends on asciimatics, which depends on Pillow, which
    # uses liblcms2.2.dylib that causes troubles on mojave. See [1]
    # and [2] for more info. As a workaround, we need to simply
    # uninstall Pillow.
    #
    # [1] https://github.com/peterbrittain/asciimatics/issues/95
    # [2] https://github.com/iterative/homebrew-dvc/issues/9
    system libexec/"bin/pip", "uninstall", "-y", "Pillow"
    system libexec/"bin/pip", "uninstall", "-y", "dvc"
    venv.pip_install_and_link buildpath

    bash_completion.install "scripts/completion/dvc.bash" => "dvc"
    zsh_completion.install "scripts/completion/dvc.zsh"
  end

  test do
    system "#{bin}/dvc", "version"
  end
end
