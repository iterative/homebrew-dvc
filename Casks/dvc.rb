cask 'dvc' do
  name 'Data Version Control'
  homepage 'https://dataversioncontrol.com'
  version '0.9.7'
  url "https://github.com/dataversioncontrol/dvc/releases/download/#{version}/dvc-#{version}.pkg"
  sha256 :no_check
  depends_on "openssl"

  pkg "dvc-#{version}.pkg"

  uninstall pkgutil: 'com.dataversioncontrol.dvc'
end
