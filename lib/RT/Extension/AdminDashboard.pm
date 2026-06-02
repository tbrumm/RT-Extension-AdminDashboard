package RT::Extension::AdminDashboard;

our $VERSION = '1.0.0';

=head1 NAME

RT::Extension::AdminDashboard - RT internals stats widget for the Admin page

=head1 DESCRIPTION

Replaces the bestpractical.com iframe on /Admin/ with a live stats widget
showing queues, custom fields, groups, users, and ticket counts by category.

=head1 INSTALLATION

    perl Makefile.PL
    make
    sudo make install

Register the plugin in F</opt/rt6/etc/RT_SiteConfig.d/002_Plugins.pm>:

    Plugin('RT::Extension::AdminDashboard');

Clear cache and restart Apache:

    sudo rm -rf /opt/rt6/var/mason_data/obj/*
    sudo service apache2 restart

=head1 AUTHOR

Torsten Brumm

=head1 LICENSE

GNU General Public License v2

=cut

1;
