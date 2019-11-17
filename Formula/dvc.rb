class Dvc < Formula
  include Language::Python::Virtualenv

  desc "Git for data science projects"
  homepage "https://dvc.org"
  url "https://github.com/iterative/dvc/archive/0.68.1.tar.gz"
  sha256 "a072ebf2151213c61ac7e580e51dc1cecefa4cd840e4f7ae1927d6710312cfe0"

  depends_on "pkg-config" => :build
#  depends_on "cython" => :build
  depends_on "openssl@1.1"
  depends_on "python"

  def install
    venv = virtualenv_create(libexec, "python3")
    File.open("dvc/utils/build.py", "w+") { |file| file.write("PKG = \"brew\"") }

    # NOTE: required for building pyarrow
#    version = Language::Python.major_minor_version "python3"
#    ENV.prepend_create_path "PYTHONPATH", Formula["cython"].opt_libexec/"lib/python#{version}/site-packages"

    system libexec/"bin/pip", "install", "Pillow"
    system libexec/"bin/pip", "install", "--no-binary", ":all:", ".[all]"
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
