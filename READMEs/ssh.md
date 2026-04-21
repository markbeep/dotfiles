## "Broken" SSH with Kitty

This is usually due to kitty using and expecting `xterm-kitty` on the remote system (`TERM=xterm-kitty`, can be checked with `printenv TERM` on remote).

Fix is to use `kitten ssh <connection>` as given [here](https://sw.kovidgoyal.net/kitty/faq/#i-get-errors-about-the-terminal-being-unknown-or-opening-the-terminal-failing-or-functional-keys-like-arrow-keys-don-t-work).
