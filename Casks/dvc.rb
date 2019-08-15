cask 'dvc' do
  name 'Data Version Control'
  homepage 'https://dataversioncontrol.com'
  version '0.55.0'
  url "https://github.com/iterative/dvc/releases/download/#{version}/dvc-#{version}.pkg"
  sha256 :no_check

  depends_on macos: '>= 10.12'

  pkg "dvc-#{version}.pkg"

  uninstall pkgutil: 'com.iterative.dvc'
end
