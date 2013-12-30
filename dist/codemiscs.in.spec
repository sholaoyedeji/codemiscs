Name:           [@]pkg[@]
Version:        [@]pkgversion[@]
Release:        1%{?dist}
Summary:        Code Miscellaneous
License:        GPLv3+
URL:            [@]pkghomepage[@]
Source0:        http://codemiscs.googlecode.com/files/%{name}-%{version}.tar.bz2

BuildRequires: sed
BuildRequires: bash
BuildRequires: gawk
BuildRequires: perl
BuildRequires: coreutils
BuildRequires: util-linux
BuildRequires: curl
BuildRequires: wget
BuildRequires: lynx
BuildRequires: %{_bindir}/xmllint
BuildRequires: aspell
BuildRequires: hunspell-devel
BuildRequires: mythes-devel
BuildRequires: espeak
BuildRequires: festival
BuildRequires: fortune-mod
BuildRequires: figlet
BuildRequires: cowsay
BuildRequires: boxes
Requires: sed
Requires: bash
Requires: gawk
Requires: perl
Requires: coreutils
Requires: util-linux
Requires: curl
Requires: wget
Requires: lynx
Requires: %{_bindir}/xmllint
Requires: aspell
Requires: hunspell
Requires: mythes
Requires: espeak
Requires: festival
Requires: fortune-mod
Requires: figlet
Requires: cowsay
Requires: boxes

%description
Code Miscellaneous
[@]pkgexplanation[@]

%prep
%setup -q

%build
%configure --docdir %{_docdir}/%{name}-%{version}
make %{?_smp_mflags}

%install
export AM_UPDATE_INFO_DIR=no
make install DESTDIR=$RPM_BUILD_ROOT

%files
%{_bindir}/*
%{_datadir}/%{name}
%{_docdir}/%{name}-%{version}
%{_mandir}/man1/*.1.*

%changelog
* Wed May 08 2013 Juan Manuel Borges Caño <juanmabcmail@gmail.com> - [@]pkgversion[@]-1
- Update to mainstream.
