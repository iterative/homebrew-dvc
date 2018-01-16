cask 'dvc' do
  name 'Data Version Control'
  homepage 'https://dataversioncontrol.com'
  version '0.8.7'
  url "https://github.com/dataversioncontrol/dvc/releases/download/#{version}-test/dvc-#{version}.pkg"
  sha256 :no_check

  depends_on formula: 'Graphviz'

  pkg "dvc-#{version}.pkg"

  uninstall pkgutil: 'com.dataversioncontrol.dvc'
end
