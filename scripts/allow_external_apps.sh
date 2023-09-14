#!/data/data/com.termux/files/usr/bin/bash

# fix Termux permissions
if [ -z "$TERMUX_VERSION" ]; then
    echo "The script should run on Termux"
    exit 1
fi

value="true"
key="allow-external-apps"
file="/data/data/com.termux/files/home/.termux/termux.properties"

mkdir -p "$(dirname "$file")"
chmod 700 "$(dirname "$file")"

if grep -P '^\s*?(?=allow-external-apps\s*?=\s*?true\s*?([^#]*?)$)' "$file" &>/dev/null; then
    sed -i -r 's/^\s*('"$key"'\s*=\s*'"$value"')(.*)/\1 #\2/g' "$file"
    echo "Fixed some errors of key-value probably containing comment without a hashtag."
fi

if grep -P '^\s*?(?=allow-external-apps\s*?=\s*?true\s*?(#.*)?$)' "$file" &>/dev/null; then
    echo "Allow-external-apps already set to true."
    exit 0
fi

if ! grep -P '^\s*?#+?\s*?(?=allow-external-apps\s*?=\s*?true\s*?(#.*)?$)' "$file" &>/dev/null; then
    [[ -s "$file" && ! -z "$(tail -c 1 "$file")" ]] && newline=$'\n' || newline=""
    sed -i "12i $newline$key = $value" "$file"
    echo "Added a new entry for the $key to $value."
else
    sed -i -r 's/^[#[:space:]]+('"$key"'\s*=\s*'"$value"'.*)/\1/g' "$file"
    echo "Modified the $key to $value."
fi