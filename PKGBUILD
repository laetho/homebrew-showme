# Maintainer: laetho

pkgname=showme-bin
pkgver=0.5.0
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
            '542cb70dc91ca787e3bda424df211fa7e6641978e804ddcbd9166a24c53f83d0'
            '435fc5ac846eaa6d5ea3ad5f4a58c3e80c3aab9b6a1785e04798d960d2e0b72e')

package() {
  if [[ $CARCH == aarch64 ]]; then
    local goarch=arm64
  else
    local goarch=amd64
  fi

  install -Dm755 "${srcdir}/showme_v${pkgver}_linux_${goarch}" "${pkgdir}/usr/bin/showme"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
