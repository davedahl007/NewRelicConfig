#!/bin/bash


# Set up file variables.
# NOTE: using ".gitignore.config" is critical so .gitignore will skip it
# NOTE: I'm also using "*DEIDENTIFIED" as the config file to check in 
#       because .gitignore is set up to ignore newrelic.config. This is 
#       just a safeguard against accidentally checking in a config file
#       with identifiable info.
tmpfile="/cygdrive/c/cygwin64/home/ddahl/code/NewRelicConfig/tmp.gitignore.config"
inputfile="/cygdrive/c/cygwin64/home/ddahl/code/NewRelicConfig/newrelic_DEIDENTIFIED.config"
outputfile="/cygdrive/c/cygwin64/home/ddahl/code/NewRelicConfig/newrelic.gitignore.config"
lic=`cat NewRelic_License.gitignore.config`
lic_placeholder=`cat NewRelic_License_Placeholder.config`
appname=`cat NewRelic_AppName.gitignore.config`
appname_placeholder=`cat NewRelic_AppName_Placeholder.config`


rm "$outputfile" "$tmpfile" 2> /dev/null
sed "s/${lic_placeholder}/${lic}/g" "$inputfile" > "$tmpfile"
sed -i "s/${appname_placeholder}/${appname}/g" "$tmpfile"
mv "$tmpfile" "$outputfile"

echo "The New Relic config file NOW CONTAINS sensative info,"
echo "and is located at $outputfile".

