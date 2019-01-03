class Dvc < Formula
  include Language::Python::Virtualenv

  desc "Git for data science projects"
  homepage "https://dataversioncontrol.com/"
  url "https://github.com/iterative/dvc/archive/0.23.2.tar.gz"

  depends_on "pkg-config" => :build
  depends_on "python"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/dvc", "--version"
  end
end
