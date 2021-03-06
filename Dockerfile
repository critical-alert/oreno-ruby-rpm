FROM centos:6.6
MAINTAINER hirokazu SUGIUCHI

# setup
RUN yum update -y
RUN yum install -y rpm-build tar

# ruby depends
RUN yum -y install readline-devel ncurses-devel gdbm-devel glibc-devel gcc openssl-devel libyaml-devel libffi-devel zlib-devel

# builduser
RUN useradd rpmbuilder

# build prepare
RUN mkdir -p /home/rpmbuilder/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
RUN chown rpmbuilder:rpmbuilder /home/rpmbuilder/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
WORKDIR /home/rpmbuilder/rpmbuild
ADD http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz SOURCES/
COPY ruby22x.spec SPECS/ruby22x.spec
RUN chmod 777 /home/rpmbuilder/rpmbuild/SOURCES/*

# build
USER rpmbuilder
CMD ["rpmbuild", "-ba", "/home/rpmbuilder/rpmbuild/SPECS/ruby22x.spec"]
