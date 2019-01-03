class Dvc < Formula
  include Language::Python::Virtualenv

  desc "Git for data science projects"
  homepage "https://dataversioncontrol.com/"
  url "https://github.com/iterative/dvc/archive/0.23.2.tar.gz"

  depends_on "pkg-config" => :build
  depends_on "python2"

  def install
    venv = virtualenv_create(libexec, "python2")
    system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
                              "--ignore-installed", buildpath
    system libexec/"bin/pip", "uninstall", "-y", name
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/dvc", "--version"
  end
end
