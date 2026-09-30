# Maintainer: laetho

pkgname=showme-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Share local web services, files, and directories at a temporary URL"
arch=('x86_64' 'aarch64')
url="https://github.com/laetho/homebrew-showme"
license=('LicenseRef-Proprietary')
provides=('showme')
conflicts=('showme')
options=('!strip' '!debug')

source=('LICENSE')
source+=("showme-${pkgver}-amd64.tar.gz::${url}/releases/download/v${pkgver}/showme_v${pkgver}_linux_amd64.tar.gz")
source+=("showme-${pkgver}-arm64.tar.gz::${url}/releases/download/v${pkgver}/showme_v${pkgver}_linux_arm64.tar.gz")
sha256sums=('00887e236b75102f3c980a79905f78948f0703260ff2ed36b1533d4b805782fe'
            'c5b6ec087f2a7af1e32df063fc12b303ad88b2e7925252badff33a773ab36131'
            'd8281f59274c29283be20b6a30a7930f540fb3363dbd05ecb42826bf0afa4e83')

package() {
  if [[ $CARCH == aarch64 ]]; then
    local goarch=arm64
  else
    local goarch=amd64
  fi

  install -Dm755 "${srcdir}/showme_v${pkgver}_linux_${goarch}" "${pkgdir}/usr/bin/showme"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
