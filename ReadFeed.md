read feed is a command that reads feeds from any source. rf uses the feed of a site to manage it with a command line interface.


---


<h1>Manual</h1>
```
RF(1)                                       User Commands                                       RF(1)



NAME
       rf - Feed Reader

SYNOPSIS
       rf [OPTIONS] [FEED]

EXAMPLE
       rf linux

DESCRIPTION
       read  feed is a command that reads feeds from any source. rf uses the feed of a site to manage
       it with a command line interface.

       Mandatory arguments for long options are mandatory for short options too.

       -l, --list
              list the available feeds

       -t, --title[=ITEMS]
              set title mode

       -d, --description=ITEM
              set description mode

       -n, --link=ITEM
              set link mode

       -c, --cache=MINUTES
              set cache time

       -v, --version
              show the program version

       -v, --variable=VARIABLE
              show a program variable

       -h, --help
              show the program help

       -m, --man
              show the program manual

       On no config creates ~/.rf directory and adds the default feeds to the ~/.rf/feeds file.  With
       no option, use title mode. With no items, show all. With no cache time, use 30 minutes.

       The  available  --variable  VARIABLES  are:  package, name, version, description, explanation,
       license, homepage, author, email, social, blog, usage, options, examples,  extrahelp,  extran‐
       otes, month, year, day and timestamp.

       Execute 'bash -c "man <(rf --man)"' to see the runtime manpage.

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



rf 2014.06.07                              Monday July 2014                                     RF(1)
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
rf (read feed) by Juan Manuel Borges Caño licensed GPLv3+ (Monday July 2014)
Feed Reader
Usage: rf [OPTIONS] [FEED]
Example: rf linux

read feed is a command that reads feeds from any source. rf uses the feed of a site to manage it with a command line interface.

Mandatory arguments for long options are mandatory for short options too:
  -l, --list                                    list the available feeds
  -t, --title[=ITEMS]                           set title mode
  -d, --description=ITEM                        set description mode
  -n, --link=ITEM                               set link mode
  -c, --cache=MINUTES                           set cache time
  -v, --version                                 show the program version
  -v, --variable=VARIABLE                       show a program variable
  -h, --help                                    show the program help
  -m, --man                                     show the program manual
On no config creates ~/.rf directory and adds the default feeds to the ~/.rf/feeds file. With no option, use title mode. With no items, show all. With no cache time, use 30 minutes.
The available --variable VARIABLES are: package, name, version, description, explanation, license, homepage, author, email, social, blog, usage, options, examples, extrahelp, extranotes, month, year, day and timestamp.
Execute 'bash -c "man <(rf --man)"' to see the runtime manpage.

rf (read feed) homepage: http://code.google.com/p/codemiscs.
rf (read feed) author: Juan Manuel Borges Caño.
rf (read feed) email: juanmabcmail@gmail.com.
rf (read feed) social: http://plus.google.com/+JuanManuelBorgesCaño
rf (read feed) blog: http://juanmabcblog.blogspot.com.
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
Simple, Straight & Effective:

```
$ rf phoronix
[1] Intel Still Polishing Their 3.0 X.Org Graphics Driver
[2] NVIDIA Publishes A New Open-Source Nouveau Driver Patch
[3] Transmageddon Video Transcoder Adding New Features
[4] Ubuntu Is Short On Developer Membership Board Nominations
[5] Wine's Performance For Direct3D Gaming With Many Drivers
[6] GNU Hurd Is Enjoying User-Space Device Drivers
[7] Valve Is Now Giving Away Their Games To Ubuntu Developers
[8] Intel Gets AVX-512 Support Going In GCC
[9] The Godot Engine Is Now Open-Source
[10] Hawaii Is Looking Great As A Wayland Desktop
[11] What It Takes To Write A Wayland Compositor
[12] GStreamer 1.4 Will Be Bringing Many New Features
[13] CodeRefactor: Turning Microsoft's MSIL/CIL Into C++
[14] Linux 3.14-rc2 Kernel Brings Fair Amount Of Fixes
[15] Wine On Android Is Making Progress, Running Solitaire
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/ReadFeed/ReadFeedPhoronix.png' />
</p>

```
$ rf linux
[1] Install Fedora on Intel NUC: A Low-Power, x86-Ready Mini PC With Grunt
[2] These Women Are Building The Software That Quietly Runs The World
[3] OpenDaylight: Open-Source SDN is Growing Fast
[4] Ubuntu Is Short On Developer Membership Board Nominations
[5] GNU Hurd Is Enjoying User-Space Device Drivers
[6] Oracle and Pluribus Team Up, Flip the Switch on Cisco SDN Killer
[7] The Godot Engine Is Now Open-Source
[8] Hawaii Is Looking Great As A Wayland Desktop
[9] How to Watch Free Online TV on Linux
[10] Linux 3.14-rc2 Kernel Brings Fair Amount Of Fixes
[11] Rebellion Might Develop Games for Linux
[12] Growing the Linux Community
[13] Wine On Android Is Making Progress, Running Solitaire
[14] Man Converts 3D Printer Into an Air Hockey Robot
[15] Debian 7.4 Rounds Up Stable Updates
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/ReadFeed/ReadFeedLinux.png' />
</p>

<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/ReadFeed/ReadFeedLinuxJournal.png' />
</p>

Supports Descriptions Of News Items:

```
$ rf phoronix --description 1
The xf86-video-intel 2.99.910 driver was released today as the latest X.Org 3.0 pre-release DDX...
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/ReadFeed/ReadFeedDescriptionPhoronix.png' />
</p>

```
$ rf linux --description 1
How well does Fedora 20 run on the Intel NUC? Does audio output over the mini HDMI work out of the box? Does suspend to RAM sometimes decide not to resume? And of course, what sort of performance and power usage is there relative to a traditional desktop machine or the high-end ARM machines such as the ODroid XU?
```

<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/ReadFeed/ReadFeedDescriptionLinuxJournal.png' />
</p>

And Has Multiple Feeds (Customizable):

```
$ rf --list
20-minutos
20-minutos-tech
barrapunto
debian-people
debian-planet
fedora-people
fedora-planet
foss-people
freecode
freedesktop-people
freedesktop-planet
freegamedev-planet
freegame-people
freegame-planet
gimp
gnome
gnome-blogs
gnome-devel
gnome-people
gnome-planet
gstreamer
gstreamer-people
gstreamer-planet
gtk
jabber-people
jabber-planet
kde
kde-people
linux
linux-journal
linux-magazine
linux-today
lwn
mozilla-people
mozilla-planet
phoronix
python-people
slashdot
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