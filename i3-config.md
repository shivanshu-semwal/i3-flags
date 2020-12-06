# i3-config

Objective | Syntax | Examples
---|---|---
Creating variables | `set $<var_name> <value>` | `set $ws1 firefox`
Changing fonts | `font pango:<family list> [<style options>] <size>` | `font pango:DejaVu Sans Mono 10` <br> `font pango:DejaVu Sans Mono, Terminus Bold Semi-Condensed 11`
Keyboard bindings | `bindsym [--release] [<Group>+][<Modifiers>+]<keysym> command` <br> `bindcode [--release] [<Group>+][<Modifiers>+]<keycode> command` | `bindsym $mod+Shift+r restart`
