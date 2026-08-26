module Packets.toServer.PlayerIdentification;

class PlayerIdentification {
    ubyte packetID = 0x00;
    ubyte protocolVersion;
    string Username;
    string verificationKey;
    ubyte unused;
}