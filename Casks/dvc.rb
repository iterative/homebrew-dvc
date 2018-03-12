cask 'dvc' do
  name 'Data Version Control'
  homepage 'https://dataversioncontrol.com'
  version '0.9.0'
  url "https://github.com/dataversioncontrol/dvc/releases/download/#{version}-test-3/dvc-#{version}.pkg"
  sha256 :no_check

  pkg "dvc-#{version}.pkg"

  uninstall pkgutil: 'com.dataversioncontrol.dvc'
end
