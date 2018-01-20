class Dvc < Formula
  include Language::Python::Virtualenv

  desc "Git for data science projects"
  homepage "https://dataversioncontrol.com/"
  url "https://github.com/dataversioncontrol/dvc/archive/0.8.7-test-test.tar.gz"

  depends_on "pkg-config" => :build
  depends_on "python"
  depends_on "graphviz"

  resource "pygraphviz" do
    url "https://files.pythonhosted.org/packages/98/bb/a32e33f7665b921c926209305dde66fe41003a4ad934b10efb7c1211a419/pygraphviz-1.3.1.tar.gz"
    sha256 "7c294cbc9d88946be671cc0d8602aac176d8c56695c0a7d871eadea75a958408"
  end

  def install
    venv = virtualenv_create(libexec)
    venv.pip_install resources
    system libexec/"bin/pip", "install", "-r", "requirements.txt"
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/dvc", "--version"
  end
end
