# Maintainer: laetho

pkgname=showme-bin
pkgver=0.2.4
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
            'bbcc461fd71d8b2f5842e92594acb150d861219c427f08dd73ca3df76db96558'
            '2eca3016c9f97b1c0d9ea214f20dd4ad5b52f84c6090d72a55e4985f869db880')

package() {
  if [[ $CARCH == aarch64 ]]; then
    local goarch=arm64
  else
    local goarch=amd64
  fi

  install -Dm755 "${srcdir}/showme_v${pkgver}_linux_${goarch}" "${pkgdir}/usr/bin/showme"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
