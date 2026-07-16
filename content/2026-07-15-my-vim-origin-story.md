+++
title = "My Vim Origin Story"
[taxonomies]
tags=["vim", "editors", "tools"]
+++

This is the story of how I found Vim and was converted to it. For you do not
find Vim; Vim finds you.

<!-- more -->

## The origin

My first exposure to Vim came at the end of my junior year of high school. The
teacher of my computer science and cybersecurity class, the esteemed Mr. Flower,
decided to teach a lesson on this weird text editor called Vim. The keybindings
were strange and esoteric, and working through the “gauntlet” of tasks Mr.
Flower had prepared for us, which consisted of performing such tasks as deleting
a line or copying a word, was very tedious, with each person making constant
mistakes and needing to stop every five seconds to check a cheat-sheet of
keybinds.

For the next couple months after that lesson, I forgot about Vim completely. I
returned to VSCode and started teaching myself C as the end of the school year
bled into the summer. As some of you probably can relate to, C development on
Windows is terrible, and I already had a desire to install Linux on something,
so I took up the challenge of installing Arch on a then six-year-old Chromebook.
The details of the installation are unimportant for this story; all that matters
is that in the end, I was left with a “proper” development server. I sshed into
the Chromebook with VSCode and began to write some C. After a while, however, I
began become annoyed by a minor inconvenience: the autocomplete, near-instant on
my local machine, had a noticeable delay before displaying any results.
Frustrated, I remembered that fateful lesson. If Vim could run on computers in
the 90s, surely it could run on my embarrassingly slow Chromebook, right?

And so, my Vim journey began.

## The first month

My first priority with Vim was creating a setup with the basic functionality I
had come to expect from an editor, with plugins for autocompletion and error
detection. Of course, I also installed a theme and statusbar for cosmetics. For
my basic use case of editing a C file, this was sufficient, and I found myself
not missing VSCode at all.

That's not to say the first month was without issue, though. I found myself
constantly having to look up how to delete a line or redo a change. Fortunately
for my developing muscle memory, the beginner's guide that I was following
suggested mapping the arrow keys to nothing so that I would be forced to use
normal mode to move around instead of using the arrow keys as a cop-out.

I also began to enjoy the more subtle features of Vim, such as being able to
send it to the background with `Ctrl+Z`, do work in a normal terminal, and then
return to my editor exactly as I left it with `fg`. Another underrated feature
of Vim, at least for me, was its lack of reliance on modifier keys. Being
left-handed, it is difficult for me to press the modifier keys with my left
pinky, instead opting to use my thumb, which is unergonomic and disrupts my flow
of typing. Thus, it was hard for me to use the more advanced keybindings in
traditional editors. In Vim, however, most motions are performed by combining
sequential key presses, like `dd` to delete a line instead of `Ctrl+Shift+K`,
keeping my fingers away from the bottom left of my keyboard.

## Neovim

After about a month of consistently using Vim, I was feeling somewhat
comfortable using the editor. It was also at this time that I began to hear
about Neovim, a modern fork of Vim. At first, I dismissed it as an unnecessary
change to my workflow. After all, Vim worked perfectly fine. However, over the
next couple of days, I started reading about all the additional features Neovim
offered. Native LSP, Treesitter, and the promise of Lua instead of VimScript
together convinced me to try it out. I spent an afternoon converting my old
vimrc to Lua and never looked back.

Another huge advantage of Neovim that I would soon learn was the huge ecosystem
of cool plugins. I spent my first week installing Neovim “essentials”, like
Telescope, Mason, blink.cmp, and Harpoon. I also took that time to familiarize
myself with Neovim's internals, as the editing interface was almost exactly the
same.

### Configuration heaven

The ease of plugin installation caused my Neovim configuration to quickly
balloon out of control. Every time I opened the editor, I found myself with the
urge to install another plugin. By the beginning of the school year, I had
almost 40. If I saw a cool plugin, I would add it, even if I had no actual use
for it. I had 4 plugins installed for debugging, even though I had never used
debuggers for VSCode.

Even though it sounds bad, there really wasn't a hit to my workflow. The base of
my config didn't change, so I was still able to wield my editor as a proper tool
while being able to mess around with more superficial aspects. And as my
configuration matured, the churn slowed down. My plugin count stabilized at
around 50, and I stopped making constant changes and began only making changes
in short bursts. This helped me tremendously, as it allowed me to focus on my
actual work most of the time.

## Return to the Dark Side

That spring, however, something catastrophic happened: Neovim 0.12 released. The
release itself was actually pretty great, with many new features to play with,
one of which being a built-in package manager. The release triggered a new burst
of development, and I spent a weekend migrating to the new package manager. It
was going smoothly until suddenly, my syntax highlighting completely broke.
Doing some troubleshooting, I initially diagnosed the issue as Treesitter having
an outdated dependency. As all I could do was wait, I reluctantly had to return
to my old editor.

It was surprisingly not bad. I didn't find myself missing anything from Neovim.
VSCode had everything I needed. I didn't even install the Vim mode plugin. In
fact, the one thing I could not get over was the lack of control. Unlike Neovim,
I couldn't control virtually aspect of the editor. Eventually, I noticed VSCode
in a system update, which caused me to reevaluate why I was even using VSCode. I
looked back into my Neovim configuration and fount some leftover share files
from before the migration. After removing them, Neovim began working perfectly
again.

I'm still on Neovim as of writing this, although I have installed the
[Zed](https://zed.dev/) editor as a backup, just in case something else happens
to my Neovim config or I need something better suited for a GUI, like debugging.
I like Zed, although it still has some rough edges. I'm fine with rough edges,
as long as I'm the cause of them. Zed's git interface is woeful, and I don't
love how some parts of it look. However, some parts of it are really good, like
its task management, which I actually copied in Neovim. My configuration is
mostly stable, down to only 31 plugins, and I think it is more than capable to
handle anything I throw at it.
