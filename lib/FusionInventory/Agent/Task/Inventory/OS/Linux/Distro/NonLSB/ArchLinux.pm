package FusionInventory::Agent::Task::Inventory::OS::Linux::Distro::NonLSB::ArchLinux;

use strict;
use warnings;

sub isInventoryEnabled {-f "/etc/arch-release"}

#####
sub findRelease {
  my $v;

  open V, "</etc/arch-release" or warn;
  chomp ($v=<V>);
  close V;
  return "ArchLinux $v";
}

sub doInventory {
  my $params = shift;
  my $inventory = $params->{inventory};

  my $OSComment;
  chomp($OSComment =`uname -v`);

  $inventory->setHardware({
      OSNAME => findRelease(),
      OSCOMMENTS => "$OSComment"
    });
}

1;
