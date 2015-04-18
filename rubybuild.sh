#!/bin/env bash
HOME=/var/tmp

mkdir -p $HOME/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
(cd $HOME/rpmbuild/SOURCES && curl -LO http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.2.tar.gz)

rpmbuild -ba $HOME/rpmbuild/SPECS/ruby22x.spec

cp $HOME/rpmbuild/RPMS/x86_64/* /shared/
