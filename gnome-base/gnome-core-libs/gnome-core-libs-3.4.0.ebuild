# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

DESCRIPTION="Sub-meta package for the core libraries of GNOME 3"
HOMEPAGE="http://www.gnome.org/"
LICENSE="as-is"
SLOT="3.0"
IUSE="cups python"

# when unmasking for an arch
# double check none of the deps are still masked !
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sparc ~x86 ~x86-freebsd ~amd64-linux ~x86-linux ~x86-solaris"

# Note to developers:
# This is a wrapper for the core libraries used by GNOME 3
RDEPEND="
	>=dev-libs/glib-2.30:2
	>=x11-libs/gdk-pixbuf-2.24:2
	>=x11-libs/pango-1.29.3
	>=media-libs/clutter-1.8:1.0
	>=x11-libs/gtk+-3.2:3[cups?]
	>=dev-libs/atk-2.2
	>=x11-libs/libwnck-${PV}:3
	>=gnome-base/librsvg-2.34[gtk]
	>=gnome-base/gnome-desktop-${PV}:3
	>=gnome-base/libgnomekbd-${PV}
	>=x11-libs/startup-notification-0.10

	>=gnome-base/gvfs-1.10
	>=gnome-base/dconf-0.10

	>=media-libs/gstreamer-0.10.32:0.10
	>=media-libs/gst-plugins-base-0.10.32:0.10
	>=media-libs/gst-plugins-good-0.10.23:0.10

	python? ( >=dev-python/pygobject-3.0:3 )
"
DEPEND=""
S=${WORKDIR}
