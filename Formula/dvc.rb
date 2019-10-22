class Dvc < Formula
  include Language::Python::Virtualenv

  desc "Git for data science projects"
  homepage "https://dvc.org"
  url "https://github.com/iterative/dvc/archive/0.63.4.tar.gz"

  depends_on "pkg-config" => :build
  depends_on "python"

  def install
    venv = virtualenv_create(libexec)
    system libexec/"bin/pip", "install", ".[all]"
    bin.install_symlink libexec/"bin/dvc"
  end

  test do
    system "#{bin}/dvc", "--version"
  end
end
