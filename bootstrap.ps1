echo "Copying gitconfig"
cp -Path .\gitconfig -Destination $HOME\.gitconfig -Force

echo "Creating powershell profile"
echo "`$global:DOTFILES = `"$pwd`"" > $profile
echo ". `$DOTFILES\powershell.ps1" >> $profile