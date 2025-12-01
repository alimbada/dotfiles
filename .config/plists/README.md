## plist conversion

Convert binary plist file to XML: `plutil -convert xml1 <input-file> -o <output-file>`

Convert XML plist file to binary: `plutil -convert binary1 <input-file> -o <output-file>`

Convert all:

```fish
for file in ~/.config/plists/*.plist.xml; plutil -convert binary1 $file -o ~/Library/Preferences/(path change-extension '' (basename $file)); end
```

## File mappings

Original locations of files in this directory:

`~/Library/Preferences/com.amethyst.Amethyst.plist`
`~/Library/Preferences/com.lwouis.alt-tab-macos.plist`
`~/Library/Preferences/org.hammerspoon.Hammerspoon.plist`
