#!/usr/bin/env bash

sudo gem uninstall compropago-2.0.0
gem build compropago.gemspec
sudo gem install compropago-2.0.0.gem