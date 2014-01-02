UltiSnips
=========

UltiSnips is a mature template library for Vim. Thus you can write code
snippets once then refer to them by short words and make Vim expand them.

This is a fork of `parent UltiSnips`_ providing some additional features eg
known from SnipMate

  - ability to read snipmate snippet files on the fly
  - snipmate like snippet completion
  - reloading snippets if snippet files timestamp changes
  - can read both: UltiSnip and snipmate snippet files on the fly

See notes at "WHY forking" below.


documentation
-------------
doc/UltiSnips.txt
  slightly adopted original documentation

doc/UltiSnips-Quickstart.txt
  rewritten documentation focusing on the most important aspects to get started
  quickly

plugin/UltiSnips.vim:
  code comments, should always be up to date


sample snippets
---------------
github.com/honza/snipmate-snippets -> UltiSnips directory (merge is in progress)
See installation

installation
-------------
See doc/UltiSnips-Quickstart.txt

BUGS
----
See doc/UltiSnips-Quickstart.txt

WHY forking?
-----------
This work is based on the original repository `parent UltiSnips`_.

What about feeding upstream?
The author knows about the fork. Its me not having time to update the test
suite - maybe I will never have. My goal is to provide value to me and the
community using the time I have and merge UltiSnips and snipmate communities
to maximize value for all parties.

A snippet engine always has two aspects:
a) the engine
b) the snippets

I know about XpTemplate, but it would have been too different.
What about fixing snipmate? Would have been too much work.

Also see some notes in snipmate-merge-todo.

Also see `discussion about merge`_


Comparison to other snipmate engines
------------------------------------
UltiSnips:
    See WHY forking above.

snipmate: (was abondoned by original author, Marc Weber and Rock Garbas kept
          maintaining it for a while)
          Current upstream is at github.com/garbas/vim-snipmate

XpTemplate: full blown VimL only engine - but too different to convert snipmate
          snippets to that format. It has some nice features, eg it can
          abstract over different coding styles (spaces)

neosnippets: 
  https://github.com/Shougo/neosnippet/
  I never used it. Its sead to be ablte to read snipmate snippets, too.


There are some more snippet engines - but from my point of view they are not
worth menthioning because they have significant less features (if you think
differently let me know)


[1] http://launchpad.net/ultisnips


Screencasts
-----------

The blog posts of the screencasts contain more advanced examples of the things
discussed in the video.

* `Episode 1: What are snippets and do I need them?`__
* `Episode 2: Creating Basic Snippets`__
* `Episode 3: What's new in version 2.0`__
* `Episode 4: Python Interpolation`__

__ http://www.sirver.net/blog/2011/12/30/first-episode-of-ultisnips-screencast/
__ http://www.sirver.net/blog/2012/01/08/second-episode-of-ultisnips-screencast/
__ http://www.sirver.net/blog/2012/02/05/third-episode-of-ultisnips-screencast/
__ http://www.sirver.net/blog/2012/03/31/fourth-episode-of-ultisnips-screencast/


.. _parent UltiSnips: http://github.com/SirVer/ultisnips
.. _discussion about merge: https://github.com/garbas/vim-snipmate/issues/114
