# Maintainer: [@]pkgauthor[@] <[@]pkgemail[@]>
pkgname=[@]pkg[@]
pkgver=[@]pkgversion[@]
pkgrel=0
pkgdesc="[@]pkgdescription[@]. [@]pkgexplanation[@]"
url="[@]pkghomepage[@]"
arch=('i686' 'x86_64')
license=('[@]pkglicense[@]')
# ideal depends=('bash' 'sed' 'gawk' 'perl' 'coreutils' 'util-linux' 'autoconf' 'curl' 'wget' 'lynx' 'libxml2' 'xmlstarlet' 'aspell' 'hunspell' 'libmythes' 'espeak' 'festival' 'vorbis-tools' 'imagemagick' 'fortune-mod' 'figlet' 'cowsay' 'boxes')
# community depends=('bash' 'sed' 'gawk' 'perl' 'coreutils' 'util-linux' 'autoconf' 'curl' 'wget' 'lynx' 'libxml2' 'xmlstarlet' 'aspell' 'hunspell' 'libmythes' 'espeak' 'festival' 'vorbis-tools' 'imagemagick' 'fortune-mod' 'figlet' 'cowsay')
depends=('bash' 'sed' 'gawk' 'perl' 'coreutils' 'util-linux' 'autoconf' 'curl' 'wget' 'lynx' 'libxml2' 'aspell' 'hunspell' 'libmythes' 'festival' 'vorbis-tools' 'imagemagick' 'figlet' 'cowsay')
# core depends=('bash' 'sed' 'gawk' 'perl' 'coreutils' 'util-linux' 'autoconf' 'curl')
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
