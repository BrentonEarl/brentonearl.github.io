#require "rubygems"
#require "jekyll"
#
#namespace :blog do
## Builds Jekyll blog prior to uploading to github
## because we are using third party plugins.  Github
## does not support third party plugins.
#
#
## Usage:
## bundle exec rake blog:build
## bundle exec rake blog:publish
#	desc "Build and publish blog on github"
#
#	task :build do
#		# Build Jekyll site from parent directory
#		# and put the generated files in _site/ dir
#		print "Making sure we are in the right directory and the right branch\n"
#		system "cd ~/Projects/Jekyll/brentonearl.github.io"
#		system "git checkout source"
#
#		print "Building site with jekyll\n"
#		Jekyll::Site.new(Jekyll.configuration({
#			"source"			=> ".",
#			"destination"	=> "_site",
#			"config"			=> "_config.yml"
#		})).process
#
#		print "Adding, committing and pushing changes to source branch\n"
#		system "git add ."
#		system "git commit -a"
#		system "git push origin source"
#
#	end
#
#
#	task :publish do
#		# Empties master branch, which contains
#		# all previously generated files. Then
#		# copies _site dir and assets dir to master.
#		# Finally, pushes changes to git hub
#		print "Switch to master branch and delete old site files\n"
#		system "git checkout master"
#		system "rm -rf *"
#
#		print "Checking out _site and assets directories into master\n"
#		system "git checkout source _site/ assets/"
#		system "cp -R _site/* ."
#		system "rm -rf _site"
#
#		print "Adding, commiting and pushing changes to master branch\n"
#		system "git add ."
#		system "git commit -a"
#		system "git push"
#		print "\n\n"
#		print "Updated site published"
#	end
#end
