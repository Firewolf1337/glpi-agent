package FusionInventory::Agent::Task::Inventory::MacOS;

use strict;
use warnings;

use parent 'FusionInventory::Agent::Task::Inventory::Module';

use FusionInventory::Agent::Tools;

our $runAfter = ["FusionInventory::Agent::Task::Inventory::Generic"];

sub isEnabled {
    return OSNAME eq 'darwin';
}

sub doInventory {}

1;
