cask 'dvc' do
  name 'Data Version Control'
  homepage 'https://dvc.org'
  version '0.62.0'
  url "https://github.com/iterative/dvc/releases/download/#{version}/dvc-#{version}.pkg"
  sha256 :no_check

  depends_on macos: '>= :sierra'

  pkg "dvc-#{version}.pkg"

  uninstall pkgutil: 'com.iterative.dvc'
end
