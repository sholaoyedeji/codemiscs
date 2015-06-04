make project is a command that makes project skeletons. mkproject automatizes the task of starting a new project with the information provided from the command line. The package created by default is a 'hello world' project of the selected skeleton that is managed with autotools. There are skeletons for bash, c, c library, python, c++, c++ library and perl.


---


<h1>Manual</h1>
```
MKPROJECT(1)                                User Commands                                MKPROJECT(1)



NAME
       mkproject - Project Generator

SYNOPSIS
       mkproject [OPTIONS]

EXAMPLE
       mkproject --skeleton bash --tarname test

DESCRIPTION
       make  project  is  a  command  that makes project skeletons. mkproject automatizes the task of
       starting a new project with the information provided from the command line. The  package  cre‐
       ated by default is a 'hello world' project of the selected skeleton that is managed with auto‐
       tools. There are skeletons for bash, c, c library, python, c++, c++ library and perl.

       Mandatory arguments for long options are mandatory for short options too.

       -l, --list
              list skeletons

       -s, --skeleton=SKELETON
              set skeleton type

       -t, --tarname=TARNAME
              set tar name

       -p, --pkgname=PKGNAME
              set package name

       -d, --description=DESCRIPTION
              set short description

       -a, --author=AUTHOR
              set author

       -b, --bugreport=BUGREPORT
              set bug report address

       -m, --homepage=HOMEPAGE
              set homepage url

       -n, --dependencies=DEPENDENCIES
              set dependencies

       -r, --verbose
              show progress messages

       -v, --version
              show the program version

       -v, --variable=VARIABLE
              show a program variable

       -h, --help
              show the program help

       -m, --man
              show the program manual

       Skeleton and Tar Name are obligatory, the rest are recommended, dependencies is optional.

       The available --variable VARIABLES are:  package,  name,  version,  description,  explanation,
       license,  homepage,  author, email, social, blog, usage, options, examples, extrahelp, extran‐
       otes, month, year, day and timestamp.

       Execute 'bash -c "man <(mkproject --man)"' to see the runtime manpage.

NOTES
       For more information, check documentation.

HOMEPAGE
       Main project page at http://code.google.com/p/codemiscs.

AUTHOR
       Programmed by Juan Manuel Borges Caño.

EMAIL
       Thank, Contact, Follow through juanmabcmail@gmail.com.

SOCIAL
       Interact with http://plus.google.com/+JuanManuelBorgesCaño

SUPPORT
       Support through Paypal, Patreon, Flattr, Western Union, BitCoin, ...

COPYRIGHT
       Copyright © 2014 Juan Manuel Borges Caño.

       This software is licensed and under the terms of the GPLv3+ License.  There is NO WARRANTY, to
       the extent permitted by law.



mkproject 2014.06.07                       Monday July 2014                              MKPROJECT(1)
```

<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h1>Awesome Code, Awesome Results</h1>
</blockquote></td>
</blockquote></tr>
</table></blockquote>


---


<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h3>Ad Supporting CodeMiscs Development</h3></blockquote></blockquote></blockquote>

<blockquote><wiki:gadget url="http://goo.gl/Uql18" width="728" height="90" border="1" up_ad_client="1499394790009918" up_ad_slot="0061131168" up_ad_width="728" up_ad_height="90" /></blockquote>

<blockquote><h3>Ad Supporting CodeMiscs Development</h3>
</blockquote><blockquote></td>
</blockquote><blockquote></tr>
</table></blockquote>


---


<h1>Help</h1>
```
mkproject (make project) by Juan Manuel Borges Caño licensed GPLv3+ (Monday July 2014)
Project Generator
Usage: mkproject [OPTIONS]
Example: mkproject --skeleton bash --tarname test

make project is a command that makes project skeletons. mkproject automatizes the task of starting a new project with the information provided from the command line. The package created by default is a 'hello world' project of the selected skeleton that is managed with autotools. There are skeletons for bash, c, c library, python, c++, c++ library and perl.

Mandatory arguments for long options are mandatory for short options too:
  -l, --list                                    list skeletons
  -s, --skeleton=SKELETON                       set skeleton type
  -t, --tarname=TARNAME                         set tar name
  -p, --pkgname=PKGNAME                         set package name
  -d, --description=DESCRIPTION                 set short description
  -a, --author=AUTHOR                           set author
  -b, --bugreport=BUGREPORT                     set bug report address
  -m, --homepage=HOMEPAGE                       set homepage url
  -n, --dependencies=DEPENDENCIES               set dependencies
  -r, --verbose                                 show progress messages
  -v, --version                                 show the program version
  -v, --variable=VARIABLE                       show a program variable
  -h, --help                                    show the program help
  -m, --man                                     show the program manual
Skeleton and Tar Name are obligatory, the rest are recommended, dependencies is optional.
The available --variable VARIABLES are: package, name, version, description, explanation, license, homepage, author, email, social, blog, usage, options, examples, extrahelp, extranotes, month, year, day and timestamp.
Execute 'bash -c "man <(mkproject --man)"' to see the runtime manpage.

mkproject (make project) homepage: http://code.google.com/p/codemiscs.
mkproject (make project) author: Juan Manuel Borges Caño.
mkproject (make project) email: juanmabcmail@gmail.com.
mkproject (make project) social: http://plus.google.com/+JuanManuelBorgesCaño
mkproject (make project) blog: http://juanmabcblog.blogspot.com.
For more information, check documentation.
```

<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h1>Awesome Code, Awesome Results</h1>
</blockquote></td>
</blockquote></tr>
</table></blockquote>


---


<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h3>Ad Supporting CodeMiscs Development</h3></blockquote></blockquote></blockquote>

<blockquote><wiki:gadget url="http://goo.gl/Uql18" width="728" height="90" border="1" up_ad_client="1499394790009918" up_ad_slot="0061131168" up_ad_width="728" up_ad_height="90" /></blockquote>

<blockquote><h3>Ad Supporting CodeMiscs Development</h3>
</blockquote><blockquote></td>
</blockquote><blockquote></tr>
</table></blockquote>


---


<h1>Use Cases</h1>
Effective:
```
$ mkproject --skeleton=bash --tarname=demo --pkgname="Demo Package" --description="A quick demo package for mkproject" --author="Juan Manuel Borges Caño" --bugreport=juanmabcmail@gmail.com --homepage "http://code.google.com/p/codemiscs" --verbose
Creating directory `demo'...done
Creating file `demo/configure.ac'...done
Creating file `demo/Makefile.am'...done
Creating file `demo/README'...done
Creating file `demo/AUTHORS'...done
Creating file `demo/ChangeLog'...done
Creating file `demo/NEWS'...done
Creating directory `src'...done
Creating file `demo/src/Makefile.am'...done
Creating file `demo/src/main.sh'...done
Executing command `autoreconf -i' (see `mkproject.log')...done

$ cd demo

$ ls 
aclocal.m4      ChangeLog     COPYING     Makefile.am  mkproject.log  src
AUTHORS         configure     INSTALL     Makefile.in  NEWS
autom4te.cache  configure.ac  install-sh  missing      README

$ cat README
Demo Package: A quick demo package for mkproject

Copyright (C) 2014 Juan Manuel Borges Caño

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program.  If not, see <http://www.gnu.org/licenses/>.

demo (Demo Package) homepage <http://code.google.com/p/codemiscs>

$ cat AUTHORS
Juan Manuel Borges Caño <juanmabcmail@gmail.com>

$ cat NEWS
2014-01-01:
        * Project start

$ cat ChangeLog
2014-01-01 Juan Manuel Borges Caño <juanmabcmail@gmail.com>
        * ChangeLog start

$ cat src/main.sh
#! /usr/bin/env bash
echo "Hello world!"

$ ./configure
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for a thread-safe mkdir -p... /usr/bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for bash... yes
configure: creating ./config.status
config.status: creating Makefile
config.status: creating src/Makefile

$ make
Making all in src
make[1]: Entering directory `demo/src'
cp ./main.sh demo
chmod +x demo
make[1]: Leaving directory `demo/src'
make[1]: Entering directory `demo'
make[1]: Nothing to be done for `all-am'.
make[1]: Leaving directory `demo'

$ src/demo
Hello world!
```

Multiple Projects Support:
```
$ mkproject -s c -t demo -p "Another Demo" -d "Another quick demo package for mkproject" -a "Juan Manuel Borges Caño" -b "juanmabcmail@gmail.com" -m "http://code.google.com/p/codemiscs"
$ cd demo
$ ls 
aclocal.m4      ChangeLog     COPYING     Makefile.am  mkproject.log  src
AUTHORS         configure     INSTALL     Makefile.in  NEWS
autom4te.cache  configure.ac  install-sh  missing      README
$ ./configure && make && src/demo && make distcheck
...
```

Minimal Needs:
```
$ mkproject -s bash -t demo --verbose
Creating directory `demo'...done
Creating file `demo/configure.ac'...done
Creating file `demo/Makefile.am'...done
Creating file `demo/README'...done
Creating file `demo/AUTHORS'...done
Creating file `demo/ChangeLog'...done
Creating file `demo/NEWS'...done
Creating directory `src'...done
Creating file `demo/src/Makefile.am'...done
Creating file `demo/src/main.sh'...done
Executing command `autoreconf -i' (see `mkproject.log')...done
$ cd demo
$ ls 
aclocal.m4      ChangeLog     COPYING     Makefile.am  mkproject.log  src
AUTHORS         configure     INSTALL     Makefile.in  NEWS
autom4te.cache  configure.ac  install-sh  missing      README
$ ./configure && make && src/demo && make distcheck
...
```

<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h1>Awesome Code, Awesome Results</h1>
</blockquote></td>
</blockquote></tr>
</table></blockquote>


---


<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h3>Ad Supporting CodeMiscs Development</h3></blockquote></blockquote></blockquote>

<blockquote><wiki:gadget url="http://goo.gl/Uql18" width="728" height="90" border="1" up_ad_client="1499394790009918" up_ad_slot="0061131168" up_ad_width="728" up_ad_height="90" /></blockquote>

<blockquote><h3>Ad Supporting CodeMiscs Development</h3>
</blockquote><blockquote></td>
</blockquote><blockquote></tr>
</table></blockquote>


---


<table width='100%' align='center'>
<tr>
<td>
<ul><li><a href='Command.md'>Command (cmd): Command Wrapper</a>
</li><li><a href='MakeProject.md'>Make Project (mkproject): Project Generator</a>
</li><li><a href='Mythes.md'>Mythes (mythes): Synonyms Mythes Interface</a>
</li><li><a href='TranslateWord.md'>Translate Word (tw): Human Language Translator</a>
</li><li><a href='ReadFeed.md'>Read Feed (rf): Feed Reader</a>
</li><li><a href='Images.md'>Images (imgs): Images Wizard</a>
</li><li><a href='Typewrite.md'>Typewrite (typewrite): Slowed Down Echoer</a>
</li><li><a href='ColorizeInput.md'>Colorize Input (colorize): Input Tinter</a>
</li><li><a href='ShellShow.md'>Shell Show (show): Show Fun</a>
</li><li><a href='ToneBeep.md'>Tone Beep (tonize): Internal Speaker Tone Beeper</a>
</li><li><a href='StatusReport.md'>Status Report (status): Status Reporter</a>
</td>
<td>
<table width='100%'>
</li></ul><blockquote><tr>
<blockquote><td align='center'>
<blockquote><h2>codemiscs (Code Miscellaneous) licensed GPLv3</h2>
<h2>by Juan Manuel Borges Caño</h2>
<p>
< <a href='http://code.google.com/p/codemiscs'>Homepage</a> ><br>
</p>
<p>
< <a href='http://code.google.com/p/codemiscs/wiki/'>Wiki</a> ><br>
</p>
<p>
< <a href='mailto:juanmabcmail@gmail.com'>Mail</a> ><br>
</p>
<p>
<a href='http://plus.google.com/+JuanManuelBorgesCaño'>Social</a>
</p>
<p>
< <a href='http://juanmabcblog.blogspot.com'>Blog</a> ><br>
</p>
</blockquote></td>
</blockquote></tr>
</table>
</td>
</tr>
</table></blockquote>

<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><h2>You can:</h2>
<p>
Thank, Comment, Follow, Contact Through Mail<br>
</p>
<p>
<strong>and</strong>
</p>
<p>
Support Through PayPal, Patreon, Flattr, Western Union & BitCoin<br>
</p>
<h1>:-)</h1>
</blockquote></td>
</blockquote></tr>
</table></blockquote>

<table width='100%'>
<blockquote><tr>
<blockquote><td align='center'>
<blockquote><p>
Copyright (C) 2007 - 2014<br>
</p>
<p>
<a href='http://plus.google.com/+JuanManuelBorgesCaño'>Juan Manuel Borges Caño</a>
</p>
</blockquote></td>
</blockquote></tr>
</table>