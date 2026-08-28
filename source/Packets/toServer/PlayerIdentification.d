module Packets.toServer.PlayerIdentification;
import Packets.Packet;
import std.array : Appender;

class PlayerIdentification : Packet {
    immutable ubyte packetID = 0x00;
    ubyte protocolVersion = 7;
    string Username;
    string verificationKey;
    ubyte unused;

    this(ubyte protocolVersion = 7, string username = "", string verificationKey = "",
        ubyte unused = 0) {
        this.protocolVersion = protocolVersion;
        this.Username = username;
        this.verificationKey = verificationKey;
        this.unused = unused;
    }

    ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        data.put(protocolVersion);
        appendFixedString(data, Username);
        appendFixedString(data, verificationKey);
        data.put(unused);
        return data.data;
    }
}