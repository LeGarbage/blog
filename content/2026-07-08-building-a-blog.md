+++
title = "Building a Blog"
[taxonomies]
tags=["meta", "web"]
+++

Building a blog sounds pretty straightforward, and it is, unless, like me, you
decide to make everything more complicated than it needs to be.

<!-- more -->

## The site

This bog was built using [Zola](https://www.getzola.org/). Zola is a static site
generator written in Rust. It uses the [Tera](https://keats.github.io/tera/)
template engine to convert Markdown content into static HTML which can then be
hosted on a service such as [GitHub Pages](https://docs.github.com/pages). The
reason I chose Zola over something like [Hugo](https://gohugo.io/) or
[Jekyll](https://jekyllrb.com/) is quite simple: it is written in Rust. You may
be wondering why I would ever choose a tool based on what language it was
written, but it makes slightly more sense in context. You see, I had just
finished rewriting my main website homepage to use Rust via WebAssembly, and I
naively thought that having my blog generator written in the same language would
make them somehow easier to integrate and host together. While that quickly
proved not to be the case, Zola itself gave me no reason to use anything else,
so I stuck with it.

Building my blog in Zola was smooth for the most part, except for a couple
things. First, I did not enjoy working with the Tera templating language. The
biggest issue was the lack of editor support. My editor kept interpreting my
Tera files as either plain HTML, in which case it didn't recognize the template
syntax at all, or a Django template, which was even worse because the Django
template syntax is similar enough to Tera that some things worked, but subtle
differences made it so that the highlighting would break even more than plain
HTML. The syntax was also somewhat esoteric, with statements being wrapped in
braces and percent signs. This problem is not unique to Tera, but it still took
away from the development environment.

### Theming

In most contexts, theming refers mostly to just changing a color palette and
maybe the font. In the context of static site generators, the theme refers to
everything that isn't the content of the site itself. This includes everything
from page layout and structure, styling, and behavior to how some Markdown
elements, like callouts, are rendered.

The Zola docs provide a [list](https://www.getzola.org/themes/) of themes that
can be used to create a full site with almost zero effort. However, I couldn't
find one that looked close to how I wanted, so I decided to make my own. A Zola
theme consists of Tera templates, Sass, and other static assets, including
JavaScript. Building the theme took a little over a week at the beginning of
this April, but the site sat without content until now, three months later.

## Hosting

As of writing this, I am hosting my blog on
[GitHub Pages](https://docs.github.com/pages). Originally, I tried to host the
blog within the same project as my existing personal page, but routing between
two different static sites with different architectures proved to be impossible.
I almost gave up until I realized that Pages does its own routing for each
repository, after which I moved the blog to its own repository and everything
just worked.

### An aside on Nix

I could write about [Nix](https://nixos.org/) for hours, but for now I will just
discuss how incredible it is for deployment. Because the Nix commands are the
same no matter what underlying tools are used, the same deployment setup can be
used across completely different projects. In this way, both my Rust-based main
page and blog built with Zola can use the same pipeline: build with nix and
serve the result.

Additionally, I can run the Nix commands locally on my machine, providing a
quick and easy way to confirm whether or not the deployment will fail without
needing to push any code. Nix guarantees the environments will be the same on my
local machine and the GitHub Actions servers.

## Future considerations

Unfortunately for me, it is my nature to constantly chase the technology that
requires the most learning to use, as exemplified by my compiling Rust to
WebAssembly display a static web page. Zola works perfectly fine, and I could
probably spend the rest of my life generating my blog with it without changing a
thing about my current setup.

However, [Astro 7.0](https://astro.build/blog/astro-7/) recently released, and
it seems to fix all of the issues I had with Zola, namely the weird templating
as well as being powerful enough for me to also rewrite my main page in it,
allowing me to consolidate my entire personal site into one place. While this
isn't a big deal right now, I may want to play with having a server side in the
future, in which case I will have to switch away from GitHub Pages, and
migrating one site is much easier than migrating two.

I will definitely make a post about the switch to Astro if/when it does happen.
In that case, most of the content on this post will be obsolete, except for the
section on Nix. Nix is forever.
