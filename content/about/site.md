+++
title="This Site"
weight=999
draft=false
+++

This site (`jph.im`) has been generated from a set of [Markdown
files][site-repo], using a [Static Site Generator][ssg-wp],
[Hugo][hugo-website].

<!--more-->

The website itself is built by and served from [Cloudflare
Pages][cloudflare-pages].

# Why use a Static-Site-Generator?

This site has no-need for any kind of server-side interaction - it's a readonly
set of HTML pages, plus a few figures and notes, so there's no need to manage
any kind of running server process - this means that the site can be created as
just a set of flat HTML pages and images, which can be served by a number of
free services online (such as Github Pages).

It's much easier to use a static-site-generator than to write HTML directly,
because it allows articles to be composed in
[Markdown](https://www.markdownguide.org) rather than writing complicated HTML
syntax, and the generator then has the job of using a ["theme"][site-repo-theme]
plus its' own logic, to turn this into a set of HTML pages. The theme was
written by myself in a day or so, just using plain HTML and CSS.

# Why Hugo?

Hugo is one of many static site generators available today, others include
Jekyll (which is supported by Github Pages natively and written in Ruby),
Next.JS (in JS), and many others, there's even ones specifically built for
documentation (such as Docaurus).

Hugo is good for me for the following reasons:

- The installation is very easy, and comprises of a single binary (for either
  the standard or "extended" version) which can be copied onto a server or into
  a small Docker image which is handy if I want to do anything with it. Trivial
  builds like this site complete in dozens of milliseconds, so build-time isn't
  a problem.
- The ecosystem for it seems fairly large, it's used by some big-name developers
  and googling for questions seems to often show results from across the web
  including (e.g) Stack Overflow and Github issues, which makes troubleshooting
  issues much easier.
- It comes with a lot of features "out of the box" (especially with the
  "extended", big-box version), and up to this point I've been able to deploy it
  without the need to include any third-party plugins or scripts (which is very
  much _not_ the experience I had with Jekyll).
- Developing templates/[themes][site-repo-theme] can be done using just the
  built-in templating language (which is simliar to small inline Go snippets,
  but with some funky syntax). It took only a few hours to work out how to
  master the templating language and allowed me to develop a theme from scratch,
  rather than trying to bash someone else's into my own
- It's written in Go, which is [one of](/about/james#skills-and-experience) the
  programming languages which I'm most familiar with, which means that if I ever
  do have to dig into the code or write any kind of plugin, then that shouldn't
  be too much of a task.

[site-repo]: https://github.com/jiphex/website
[site-repo-theme]: https://github.com/jiphex/website/tree/main/themes/impthink2021
[ssg-wp]: https://en.wikipedia.org/wiki/Web_template_system#Static_site_generators
[hugo-website]: https://gohugo.io
[cloudflare-pages]: https://pages.cloudflare.com
