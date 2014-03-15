# Maintainer: [@]pkgauthor[@] <[@]pkgemail[@]>
pkgname=[@]pkg[@]
pkgver=[@]pkgversion[@]
pkgrel=0
pkgdesc="[@]pkgdescription[@]. [@]pkgexplanation[@]"
url="[@]pkghomepage[@]"
arch=('i686' 'x86_64')
license=('[@]pkglicense[@]')
depends=('bash' 'sed' 'gawk' 'perl' 'coreutils' 'util-linux' 'autoconf' 'curl' 'mlocate')
source=("${pkgname}-${pkgver}.tar.bz2")
md5sums=('[@]pkgmd5sum[@]')

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure  --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
}
