+++
title="This Site"
weight=999
draft=false
+++

The site you're reading (`jph.im`) has been generated from a set of [Markdown
files][site-repo], using a [Static Site Generator][ssg-wp],
[Hugo][hugo-website].

The website itself is served from [Github Pages][github-pages-docs], and is
automatically published using a [Github Action][hugo-github-action] which runs
whenever a commit is made to the main branch.

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

# Why Github Pages?

It may seem slightly odd, that as a systems administrator who's interested in
setting up services and distributed systems for "fun", that I'd choose a
"hands-off" service such as Github Pages to publish a website about it.

In fact, the ease of Github Pages and the fact that it's free of charge actually
mean that it's a better answer for this kind of simple hosting than doing it
"myself".

With GitHub Pages, there's little chance of me having to do anything about a
broken website (as Github's SREs will fix it anyway), there's no security
worries or upgrades to worry about, and there's no chance that it'll end up
costing me actual money because it got spammed into oblivion or posted on some
news aggregator website.

There are some small niggles when it comes to using Github Pages, which would be
resolved if I were to host it on a service which I had slightly more control
of:

- It's not possible to control [security headers](https://securityheaders.com)
  on Github Pages, which means that the configuration of the site is slightly
  less secure than I'd like (for example I'd want to lockdown the
  Content-Security-Policy, enable Strict-Transport-Security, and configure a
  Feature-Policy, however none of these are options offered by Github
- I'm missing some logging, which I might be able to do something with if I had
  access to the underlying server behind the site. I don't want to have to
  include any kind of analytics/tracking, so I'm somewhat in the dark when it
  comes to knowing what kind of traffic the site is getting (I might also get
  this from e.g Cloudflare if I had access to the CDN behind it.
- I'm unable to see or control the CDN configuration for the site. I know that
  Github Pages uses Fastly as their CDN, but if it was under my control, I'd be
  able to control the caching behaviour better to try and increase the loading
  speed of the site (by configuring a slightly more aggressive caching policy).
  This doesn't actually have much real-world impact though, as any server-load
  issues would be Github's problem anyway, and the site loads pretty fast
  anyway.

One day, I might move the hosting of these pages to another service, such as
Amazon Cloudfront, Cloudflare R2, BackBlaze B2, Vercel or similar, and I'll
write it up here if I get around to it.

[site-repo]: https://github.com/jiphex/website
[site-repo-theme]: https://github.com/jiphex/website/tree/main/themes/impthink2021
[ssg-wp]: https://en.wikipedia.org/wiki/Web_template_system#Static_site_generators
[hugo-website]: https://gohugo.io
[github-pages-docs]: https://guides.github.com/features/pages/
[hugo-github-action]: https://github.com/peaceiris/actions-hugo
