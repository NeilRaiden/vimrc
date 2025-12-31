# Keyboard layout: GhosTTY

Lyout used when VIM is running inside **GhosTTY**.

<https://ghostty.org/docs/config/reference#macos-option-as-alt>
Notes:
 - `ghostty +list-keybinds --default` doesn't show the Option+key (Layer 3 and 4) bindings.

## Layer 3 (Win/Lin: RightAlt; macOS: Option):
┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
│ à │ ± │ ² │ ³ │ ´ │ µ │ ¶ │ · │ ¸ │ ¹ │ ° │ ­ │ ½ │ bksp │
├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
│ tab │ ñ │ ÷ │ å │ ò │ ô │ ù │ õ │ é │ ï │ ð │ Û │ Ý │ Ü  │
├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
│ caps  │ á │ ó │ ä │ æ │ ç │ è │ ê │ ë │ ì │ » │ § │  ent │
├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
│ shift   │ ú │ ø │ ã │ ö │ â │ î │ í │ ¬ │ ® │ ¯ │  shift │
└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
                     (Alt+space = U+A0)

# Layer 4 (Option/AltGr + Shift + Key):
┌───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬───┬──────┐
│ þ │ ¡ │ _ │ £ │ ¤ │ ¥ │ Þ │ ¦ │ ª │ ¨ │ © │ ß │ « │ bksp │
├───┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬────┤
│ tab │ Ñ │ × │ Å │ Ò │ Ô │ Ù │ Õ │ É │ Ï │ Ð │ û │ ý │ ü  │
├─────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴────┤
│ caps  │ Á │ Ó │ Ä │ Æ │ Ç │ È │ Ê │ Ë │ Ì │ º │ ¢ │  ent │ 
├───────┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴─┬─┴──────┤
│ shift   │ Ú │ Ø │ Ã │ Ö │ Â │ Î │ Í │ ¼ │ ¾ │ ¿ │  shift │ 
└─────────┴───┴───┴───┴───┴───┴───┴───┴───┴───┴───┴────────┘
                     (Alt+space = U+A0)
# Layer 4 Alt+Shift+2 dead-key
- Alt+Sh+2 a<space> - Á 
- Alt+Sh+2 b<space> - Â

# Unicode input:
* Linux: press Ctrl+Shift+u then 4-digits code
* Mac:   press Ctrl+v, then u, then 4-digits code
* Mac:   press Ctrl+v, then U, then 8-digits code

## phonetic symbols:
* U+02B0 xʰ &#688; - Modifier Letter Small H
* U+02B3 xʳ &#691; - Modifier Letter Small R
* U+02B4 xʴ &#692; - Modifier Letter Small Turned R
* U+02C0 xˀ &#704; - Modifier Letter Glottal Stop
* U+02C1 xˁ &#705; - Modifier Letter Reversed Glottal Stop

# VIM digraphs
* `:dig`  - shows table of predefined digraphs
* `:dig!` - show headers for easier browsing
* `:help dig`
* Ctrl+k {char1}{char2} - enter digraph in INSERT mode.
* Examples:
	- `Ctrl+k +-` - outputs ±
	- `Ctrl+k My` - outputs µ
	- `Ctrl+k u:` - outputs ü (u-umlaut)
	- `Ctrl+k e'` - outputs é (e acute)
	- `Ctrl+k e!` - outputs è (e grave)
	- `Ctrl+k o-` - outputs ō (o macron)
	- `Ctrl+k o"` - outputs ő (o double-acute)
	- `Ctrl+k n?` - outputs ñ (n tilde)
	- `Ctrl+k L=` - outputs Л (Russian "L")
	- `Ctrl+k =P` - outputs ₽ (Rouble symbol)
	- `Ctrl+k b*` - outputs β (* for Greek)


