package FusionInventory::Agent::SNMP::MibSupportTemplate;

use strict;
use warnings;

#use parent 'FusionInventory::Agent::SNMP::MibSupportTemplate';

#use FusionInventory::Agent::Tools::SNMP;

# define here constants as defined in related mib
use constant    enterprises     => '.1.3.6.1.4.1' ;
#use constant   sectionOID      => enterprises . '.XYZ';
#use constant   valueOID        => oidSection . '.xyz.abc';
#use constant   mibOID          => oidSection . '.x.y.z';

our $mibSupport = [
    # Examples of mib support by sysobjectid matching
    #{
    #    name        => "mibName",
    #    sysobjectid => qr/^\.1\.3\.6\.1\.4\.1\.ENTREPRISE\.X\.Y/
    #},
    #{
    #    name        => "mibName",
    #    sysobjectid => getRegexpOidMatch(enterprises . '.ENTREPRISE.X.Y')
    #},
    # Example of mib support by checking snmp agent exposed mib support
    # via sysORID entries
    #{
    #    name    => "mibName",
    #    oid     => mibOID
    #}
];

sub new {
    my ($class, %params) = @_;

    return unless $params{device};

    my $self = {
        _device => $params{device}
    };

    bless $self, $class;

    return $self;
}

sub device {
    my ($self) = @_;

    return $self->{_device};
}

sub get {
    my ($self, $oid) = @_;

    return $self->{_device} && $self->{_device}->get($oid);
}

sub walk {
    my ($self, $oid) = @_;

    return $self->{_device} && $self->{_device}->walk($oid);
}

sub getSequence {
    my ($self, $oid) = @_;

    return unless $self->{_device};

    my $walk = $self->{_device}->walk($oid);

    return unless $walk;

    return [
        map { $walk->{$_} }
        sort  { $a <=> $b }
        keys %$walk
    ];
}

sub getFirmware {
    #my ($self) = @_;

    #return $self->get(sectionOID . '.X.A');
}

sub getFirmwareDate {
    #my ($self) = @_;

    #return $self->get(sectionOID . '.X.B');
}

sub getSerial {
    #my ($self) = @_;

    #return $self->get(sectionOID . '.X.C');
}

sub getMacAddress {
    #my ($self) = @_;

    #return $self->get(sectionOID . '.X.D');
}

sub getIp {
    #my ($self) = @_;

    #return $self->get(sectionOID . '.X.E');
}

sub getModel {
    #my ($self) = @_;

    #return $self->get(sectionOID . '.X.F');
}

sub run {
    #my ($self) = @_;

    #my $device = $self->device
    #    or return;

    #my $other_firmware = {
    #    NAME            => 'XXX Device',
    #    DESCRIPTION     => 'XXX ' . $self->get(sectionOID . '.X.D') .' device',
    #    TYPE            => 'Device type',
    #    VERSION         => $self->get(sectionOID . '.X.D'),
    #    MANUFACTURER    => 'XXX'
    #};
    #$device->addFirmware($other_firmware);
}

1;

__END__

=head1 NAME

Parent/Template class for inventory module

=head1 DESCRIPTION

Base class used for Mib support
