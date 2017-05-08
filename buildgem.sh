#!/usr/bin/env bash

sudo gem uninstall compropago_sdk*
gem build compropago_sdk.gemspec
sudo gem install compropago_sdk*.gem