#!/bin/bash
# Import all external git repositories to proper locations

# Set these variables before running this script:
root="C:\\\Code\\\Sitecore.HelixBase"
web="src/Project/HelixBase/Sitecore.HelixBase.Website"

installDynamicPlaceholderRendering=true
installFieldType=true
installMediaType=true
installResponsiveImage=true
installStandardValueCustomToken=true

# Create Unicorn files for web project
location="$web/App_Config/Include/Unicorn/"
file="Unicorn.Configs.Sitecore.System"

cp "$location/$file.example" "$location/$file.config"

sed -i "s/\[Replace with Solution path\]/$root/g" "$location/$file.config"

# Import Sitecore.Foundation.Extension.DynamicPlaceholderRendering Repo
if [ installDynamicPlaceholderRendering ]; then
	repo="https://github.com/Xalor90/Sitecore.Foundation.Extension.DynamicPlaceholderRendering.git"
	location="src/Foundation/Extension/Sitecore.Foundation.Extension.DynamicPlaceholderRendering"

	rm -rf "$location"
	git clone "$repo" "$location"

	dirPath="App_Config/Include/Foundation/Extension/"
	dir="DynamicPlaceholderRendering/"

	mkdir -p "$web/$dirPath"
	rm -rf "$web/$dirPath/$dir"
	cp -R "$location/$dirPath/$dir" "$web/$dirPath/$dir"
fi

# Import Sitecore.Foundation.Extension.FieldType Repo
if [ installFieldType ]; then
	repo="https://github.com/Xalor90/Sitecore.Foundation.Extension.FieldType.git"
	location="src/Foundation/Extension/Sitecore.Foundation.Extension.FieldType"

	rm -rf "$location"
	git clone "$repo" "$location"

	file="App_Config/Include/Unicorn/Unicorn.Configs.Foundation.Extension.FieldType.config"

	cp	"$location/$file" "$web/$file"

	sed -i "s/\[Replace with Solution path\]/$root/g" "$web/$file"
fi

# Import Sitecore.Foundation.Extension.MediaType Repo
if [ installMediaType ]; then
	repo="https://github.com/Xalor90/Sitecore.Foundation.Extension.MediaType.git"
	location="src/Foundation/Extension/Sitecore.Foundation.Extension.MediaType"

	rm -rf "$location"
	git clone "$repo" "$location"

	dirPath="App_Config/Include/Foundation/Extension/"
	dir="MediaType/"

	mkdir -p "$web/$dirPath"
	rm -rf "$web/$dirPath/$dir"
	cp -R "$location/$dirPath/$dir" "$web/$dirPath/$dir"

	dirPath="sitecore/shell/"
	dir="override/"

	mkdir -p "$web/$dirPath"
	rm -rf "$web/$dirPath/$dir"
	cp -R "$location/$dirPath/$dir" "$web/$dirPath/$dir"
fi

# Import Sitecore.Foundation.Extension.ResponsiveImage Repo
if [ installResponsiveImage ]; then
	repo="https://github.com/Xalor90/Sitecore.Foundation.Extension.ResponsiveImage.git"
	location="src/Foundation/Extension/Sitecore.Foundation.Extension.ResponsiveImage"

	rm -rf "$location"
	git clone "$repo" "$location"

	dirPath="App_Config/Include/Foundation/Extension/"
	dir="ResponsiveImage/"

	mkdir -p "$web/$dirPath"
	rm -rf "$web/$dirPath/$dir"
	cp -R "$location/$dirPath/$dir" "$web/$dirPath/$dir"
fi

# Import Sitecore.Foundation.Extension.StandardValueCustomToken Repo
if [ installStandardValueCustomToken ]; then
	repo="https://github.com/Xalor90/Sitecore.Foundation.Extension.StandardValueCustomToken.git"
	location="src/Foundation/Extension/Sitecore.Foundation.Extension.StandardValueCustomToken"

	rm -rf "$location"
	git clone "$repo" "$location"

	dirPath="App_Config/Include/Foundation/Extension/"
	dir="StandardValueCustomToken/"

	mkdir -p "$web/$dirPath"
	rm -rf "$web/$dirPath/$dir"
	cp -R "$location/$dirPath/$dir" "$web/$dirPath/$dir"
fi