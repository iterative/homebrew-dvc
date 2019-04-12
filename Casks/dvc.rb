cask 'dvc' do
  name 'Data Version Control'
  homepage 'https://dataversioncontrol.com'
  version '0.35.7'
  url "https://github.com/iterative/dvc/releases/download/#{version}/dvc-#{version}.pkg"
  sha256 :no_check

  pkg "dvc-#{version}.pkg"

  uninstall pkgutil: 'com.iterative.dvc'
end
