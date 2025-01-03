echo "Building Brewfile"

BREWFILE=$(brew bundle dump --describe --file=- --force)

echo ""
echo "$BREWFILE"
echo ""

echo "Saving Brewfile to /Brewfile"

echo "$BREWFILE" >../Brewfile

