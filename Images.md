images is a program that fetches and/or manipulates groups of images. imgs fetches google images, unify groups to sizes and builds slideshows.


---


<h1>Manual</h1>
```
IMGS(1)                                     User Commands                                     IMGS(1)



NAME
       imgs - Images Wizard

SYNOPSIS
       imgs [OPTIONS] [MODE] [-- MODEOPTIONS]

EXAMPLE
       imgs custom -- linux 50 320x240

DESCRIPTION
       images  is  a  program  that  fetches and/or manipulates groups of images. imgs fetches google
       images, unify groups to sizes and builds slideshows.

       Mandatory arguments for long options are mandatory for short options too.

       -l, --list
              list modes

       -v, --version
              show the program version

       -v, --variable=VARIABLE
              show a program variable

       -h, --help
              show the program help

       -m, --man
              show the program manual

       By default works in custom mode. Respect the terms of use of online services.

       The available --variable VARIABLES are:  package,  name,  version,  description,  explanation,
       license,  homepage,  author, email, social, blog, usage, options, examples, extrahelp, extran‐
       otes, month, year, day and timestamp.

       Execute 'bash -c "man <(imgs --man)"' to see the runtime manpage.

NOTES
       Don't Fetch Useless Stuff, Be Clever. Don't Abuse Services, It's not funny, Be Nice.  Develop‐
       ment Getting Out Of Google Services. For more information, check documentation.

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



imgs 2014.06.07                            Monday July 2014                                   IMGS(1)
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
imgs (images) by Juan Manuel Borges Caño licensed GPLv3+ (Monday July 2014)
Images Wizard
Usage: imgs [OPTIONS] [MODE] [-- MODEOPTIONS]
Example: imgs custom -- linux 50 320x240

images is a program that fetches and/or manipulates groups of images. imgs fetches google images, unify groups to sizes and builds slideshows.

Mandatory arguments for long options are mandatory for short options too:
  -l, --list                                    list modes
  -v, --version                                 show the program version
  -v, --variable=VARIABLE                       show a program variable
  -h, --help                                    show the program help
  -m, --man                                     show the program manual
By default works in custom mode. Respect the terms of use of online services.
The available --variable VARIABLES are: package, name, version, description, explanation, license, homepage, author, email, social, blog, usage, options, examples, extrahelp, extranotes, month, year, day and timestamp.
Execute 'bash -c "man <(imgs --man)"' to see the runtime manpage.

imgs (images) homepage: http://code.google.com/p/codemiscs.
imgs (images) author: Juan Manuel Borges Caño.
imgs (images) email: juanmabcmail@gmail.com.
imgs (images) social: http://plus.google.com/+JuanManuelBorgesCaño
imgs (images) blog: http://juanmabcblog.blogspot.com.
Don't Fetch Useless Stuff, Be Clever. Don't Abuse Services, It's not funny, Be Nice. Development Getting Out Of Google Services. For more information, check documentation.
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
Automatic Fetch Of Online Services (Only Google Images):

```
$ imgs fetch "Linux" 
Linux-1394297611
```

Animated Image Slideshow From Static Ones:

```
$ imgs slideshow 320x240 Linux-*/* "Linux.gif"
Unification-320x240-SQcq6YNdao
Linux.gif
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Images/Linux.gif' />
</p>

Straight Fetch Of Online Images To Animated Slideshow

```
$ imgs fortune 320x240 "Linux"
Linux
Linux-1394297471
Unification-320x240-Q2vlwcCkXu
Linux.gif
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Images/Linux.gif' />
</p>

Content Amusement With Random Terms:

```
$ imgs fortune
diffusors
diffusors-1394297241
Unification-320x240-FvaKmCr69W
diffusors.gif
```
<p align='center'>
<img src='https://codemiscs.googlecode.com/git/shots/Images/Diffusors.gif' />
</p>

Modes Of Operation:

```
$ imgs --list
fetch
unify
slideshow
fortune
custom
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