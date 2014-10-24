#!/bin/bash


# Set up file variables.
# NOTE: using "_Sensative.config" is critical so .getignore dosn't check in to gethub
# NOTE: I'm also using "*DEIDENTIFIED" as the config file to check in because .gitignore
#       is set up to ignore newrelic.config. This is just a safeguard against accidentally
#       checking in a config file with identifiable info.
tmpfile="/cygdrive/c/cygwin64/home/ddahl/code/NewRelicConfig/tmp_Sensative.config"
inputfile="/cygdrive/c/ProgramData/New Relic/.NET Agent/newrelic.config"
outputfile="/cygdrive/c/cygwin64/home/ddahl/code/NewRelicConfig/newrelic_DEIDENTIFIED.config"
lic=`cat NewRelic_License_Sensative.config`
lic_placeholder=`cat NewRelic_License_Placeholder.config`
appname=`cat NewRelic_AppName_Sensative.config`
appname_placeholder=`cat NewRelic_AppName_Placeholder.config`


rm "$outputfile" "$tmpfile" 2> /dev/null
sed "s/${lic}/${lic_placeholder}/g" "$inputfile" > "$tmpfile"
sed -i "s/${appname}/${appname_placeholder}/g" "$tmpfile"
mv "$tmpfile" "$outputfile"

echo "The New Relic config file has been stripped of sensative info,"
echo "and is located at $outputfile".
