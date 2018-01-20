class Dvc < Formula
  include Language::Python::Virtualenv

  desc "Git for data science projects"
  homepage "https://dataversioncontrol.com/"
  url "https://github.com/dataversioncontrol/dvc/archive/0.8.7-test-test.tar.gz"

  depends_on "python"
  depends_on "Graphviz"

  def install
    venv = virtualenv_create(libexec)
    system libexec/"bin/pip", "install", "-r", "requirements.txt"
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/dvc", "--version"
  end
end
