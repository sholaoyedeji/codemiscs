Name: [@]pkg[@]
Summary: [@]pkgdescription[@]
Version: [@]pkgversion[@]
License: [@]pkglicense[@]
URL: [@]pkghomepage[@]
Source0: %{name}-%{version}.tar.bz2
Release: 1%{?dist}
Group: Applications/Text

%if 0%{?ideal}
Requires: sed
Requires: bash
Requires: gawk
Requires: perl
Requires: coreutils
Requires: util-linux
Requires: curl
Requires: wget
Requires: lynx
Requires: libxml2
Requires: xmlstarlet
Requires: aspell
Requires: hunspell
Requires: mythes
Requires: espeak
Requires: festival
Requires: vorbis-tools
Requires: ImageMagick
Requires: fortune-mod
Requires: figlet
Requires: cowsay
Requires: boxes

BuildRequires: sed
BuildRequires: bash
BuildRequires: gawk
BuildRequires: perl
BuildRequires: coreutils
BuildRequires: util-linux
BuildRequires: curl
BuildRequires: wget
BuildRequires: lynx
BuildRequires: libxml2
BuildRequires: xmlstarlet
BuildRequires: aspell
BuildRequires: hunspell-devel
BuildRequires: mythes-devel
BuildRequires: espeak
BuildRequires: festival
BuildRequires: vorbis-tools
BuildRequires: ImageMagick
BuildRequires: fortune-mod
BuildRequires: figlet
BuildRequires: cowsay
BuildRequires: boxes
%endif

Requires: sed
Requires: bash
Requires: gawk
Requires: perl
Requires: coreutils
Requires: util-linux
Requires: curl
Requires: wget
Requires: lynx
Requires: libxml2
%if (! 0%{?centos_version}) && (! 0%{?rhel_version})
Requires: xmlstarlet
%endif
Requires: aspell
Requires: hunspell
Requires: mythes
%if (! 0%{?centos_version} == 505) && (! 0%{?rhel_version})
Requires: espeak
%endif
Requires: festival
Requires: vorbis-tools
Requires: ImageMagick
%if (! 0%{?centos_version}) && (! 0%{?rhel_version}) && (! 0%{?suse_version})
Requires: fortune-mod
%endif
%if (! 0%{?centos_version}) && (! 0%{?rhel_version}) && (! 0%{?sles_version})
Requires: figlet
%endif
%if (! 0%{?centos_version}) && (! 0%{?rhel_version}) && (! 0%{?suse_version})
Requires: cowsay
%endif
%if (! 0%{?centos_version}) && (! 0%{?rhel_version}) && (! 0%{?suse_version})
Requires: boxes
%endif

%if 0%{?centos_version} || 0%{?rhel_version} || 0%{?suse_version}
BuildRequires: gcc-c++
%endif
BuildRequires: sed
BuildRequires: bash
BuildRequires: gawk
BuildRequires: perl
BuildRequires: coreutils
BuildRequires: util-linux
BuildRequires: curl
BuildRequires: wget
BuildRequires: lynx
BuildRequires: libxml2
%if (! 0%{?centos_version}) && (! 0%{?rhel_version})
BuildRequires: xmlstarlet
%endif
BuildRequires: aspell
%if (! 0%{?centos_version} == 505) && (! 0%{?rhel_version} == 505)
BuildRequires: hunspell-devel
%endif
%if (! 0%{?centos_version}) && (! 0%{?rhel_version}) && (! 0%{?sles_version})
BuildRequires: mythes-devel
%endif
%if (! 0%{?centos_version} == 505) && (! 0%{?rhel_version})
BuildRequires: espeak
%endif
BuildRequires: festival
BuildRequires: vorbis-tools
BuildRequires: ImageMagick
%if (! 0%{?centos_version}) && (! 0%{?rhel_version}) && (! 0%{?suse_version})
BuildRequires: fortune-mod
%endif
%if (! 0%{?centos_version}) && (! 0%{?rhel_version}) && (! 0%{?sles_version})
BuildRequires: figlet
%endif
%if (! 0%{?centos_version}) && (! 0%{?rhel_version}) && (! 0%{?suse_version})
BuildRequires: cowsay
%endif
%if (! 0%{?centos_version}) && (! 0%{?rhel_version}) && (! 0%{?suse_version})
BuildRequires: boxes
%endif

%description
[@]pkgexplanation[@]

%prep
%setup -q

%build
%configure --docdir %{_docdir}/%{name}-%{version}
make %{?_smp_mflags}

%install
make install DESTDIR="$RPM_BUILD_ROOT"

%files
%{_bindir}/*
%{_datadir}/%{name}
%{_docdir}/%{name}-%{version}
%{_mandir}/man1/*.1.*

%changelog
* [@]pkglogstamp[@] [@]pkgauthor[@] <[@]pkgemail[@]> - [@]pkgversion[@]-1
- In Sync With Project ChangeLog 
