# Maintainer: laetho

pkgname=showme-bin
pkgver=0.3.0
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
            'a018ebea37c556b19c4c1a994d5698ed53d07a342cca04b1e50f488b32eadd2e'
            '426250c3ec6aa3a3b95f7f685ade70d286744d32081de1cceeabbec6604efe96')

package() {
  if [[ $CARCH == aarch64 ]]; then
    local goarch=arm64
  else
    local goarch=amd64
  fi

  install -Dm755 "${srcdir}/showme_v${pkgver}_linux_${goarch}" "${pkgdir}/usr/bin/showme"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
