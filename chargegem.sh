#!/usr/bin/env bash


sudo gem uninstall compropago*
gem build compropago.gemspec
sudo gem install compropago*.gem