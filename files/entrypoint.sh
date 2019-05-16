#!/bin/sh

set -e

#copy configs if not exists
cp -an DefaultConfig/. Config/

dotnet TwitchLiveStreamsNotifier.Start.dll