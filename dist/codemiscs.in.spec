Name:           [@]pkg[@]
Version:        [@]pkgversion[@]
Release:        1%{?dist}
Summary:        Code Miscellaneous
License:        GPLv3+
URL:            [@]pkghomepage[@]
Source0:        http://codemiscs.googlecode.com/files/%{name}-%{version}.tar.bz2

BuildRequires: hunspell-devel
BuildRequires: mythes-devel
BuildRequires: lynx
BuildRequires: aspell
BuildRequires: espeak
Requires: sed
Requires: bash
Requires: gawk
Requires: coreutils
Requires: %{_bindir}/xmllint
Requires: curl
Requires: util-linux
Requires: lynx
Requires: aspell
Requires: espeak

%description
Code Miscellaneous

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
* Wed May 08 2013 Juan Manuel Borges Caño <juanmabcmail@gmail.com> - 0.9.0-1
- Update to mainstream.
