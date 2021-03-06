# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-base/libgnome-keyring/libgnome-keyring-3.2.2.ebuild,v 1.2 2012/01/13 20:23:49 tetromino Exp $

EAPI="4"
GCONF_DEBUG="yes"
GNOME2_LA_PUNT="yes"

inherit gnome2 python

DESCRIPTION="Compatibility library for accessing secrets"
HOMEPAGE="http://live.gnome.org/GnomeKeyring"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~mips ~sh ~x86 ~x86-fbsd ~amd64-linux ~x86-linux ~sparc-solaris"
IUSE="debug doc +introspection test"

RDEPEND=">=sys-apps/dbus-1.0
	>=gnome-base/gnome-keyring-3.1.92
	introspection? ( >=dev-libs/gobject-introspection-1.30.0 )"
DEPEND="${RDEPEND}
	sys-devel/gettext
	>=dev-util/intltool-0.35
	>=dev-util/pkgconfig-0.9
	doc? ( >=dev-util/gtk-doc-1.9 )
	test? ( =dev-lang/python-2* )"

pkg_setup() {
	DOCS="AUTHORS ChangeLog NEWS README"

	if use test; then
		python_set_active_version 2
		python_pkg_setup
	fi
}

src_prepare() {
	gnome2_src_prepare

	# FIXME: Remove silly CFLAGS
	sed -e 's:CFLAGS="$CFLAGS -g:CFLAGS="$CFLAGS:' \
		-e 's:CFLAGS="$CFLAGS -O0:CFLAGS="$CFLAGS:' \
		-i configure.ac configure || die "sed failed"
}

src_test() {
	unset DBUS_SESSION_BUS_ADDRESS
	dbus-launch emake check || die "tests failed"
}
