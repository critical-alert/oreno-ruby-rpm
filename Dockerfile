FROM centos:6.6
MAINTAINER hirokazu SUGIUCHI

# setup
RUN yum update -y
RUN yum install -y rpm-build tar

# ruby depends
RUN yum -y install readline-devel ncurses-devel gdbm-devel glibc-devel gcc openssl-devel libyaml-devel libffi-devel zlib-devel

# build
RUN mkdir -p /var/tmp/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
WORKDIR /var/tmp/rpmbuild
ADD http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz SOURCES/
COPY ruby22x.spec ./SPECS/ruby22x.spec
CMD ["rpmbuild", "-ba", "./SPECS/ruby22x.spec"]
