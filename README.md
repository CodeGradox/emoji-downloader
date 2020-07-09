# Download all emoji to a file

Generate the emoji file:
```
chmod +x generate.rb
./generate
# OR
ruby generate.rb
```

Example: select emoji with rofi

```fish
#!/usr/bin/fish

set -l emoji (cat $HOME/git/emoji/emoji | rofi -dmenu -i -p 'Emoji:' -no-custom )

if test $status -eq 0
  echo $emoji | awk '{ print $1 }' | wl-copy -n
end
```
