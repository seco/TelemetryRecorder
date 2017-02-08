#!/usr/bin/perl
#udpserver.pl

use IO::Socket::INET;

# flush after every write
$| = 1;

my ($socket,$received_data);
my ($peeraddress,$peerport);
my @fields;
my $counter;

#  we call IO::Socket::INET->new() to create the UDP Socket and bound
# to specific port number mentioned in LocalPort and there is no need to provide
# LocalAddr explicitly as in TCPServer.
$socket = new IO::Socket::INET ( LocalPort => '4445',Proto => 'udp',) or die "ERROR in Socket Creation : $!\n";

while(1)
{
# read operation on the socket
$socket->recv($recieved_data,1024);

#get the peerhost and peerport at which the recent data received.
$peer_address = $socket->peerhost();
$peer_port = $socket->peerport();
#print "\n($peer_address , $peer_port) said :$recieved_data";
my @fields = split "," , $recieved_data;

$counter = 0;
foreach (@fields) {
  print $counter . ":" . "$_\n";
  $counter++;
}


#send the data to the client at which the read/write operations done recently.
#$data = “data from server\n”;
#print $socket “$data”;

}

$socket->close();
