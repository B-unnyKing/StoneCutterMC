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

    override ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        data.put(protocolVersion);
        appendFixedString(data, Username);
        appendFixedString(data, verificationKey);
        data.put(unused);
        return data.data;
    }
}

string decodeFixedString(const(ubyte)[] data, size_t offset, size_t length) {
    size_t end = offset + length;
    if (end > data.length) {
        end = data.length;
    }

    while (end > offset && data[end - 1] == ' ') {
        --end;
    }

    return cast(string) cast(char[]) data[offset .. end];
}

PlayerIdentification decodePlayerIdentification(ubyte[] data) {
    if (data.length < 131) {
        throw new Exception("PlayerIdentification packet too short");
    }

    return new PlayerIdentification(
        data[1],
        decodeFixedString(data, 2, 64),
        decodeFixedString(data, 66, 64),
        data[130]
    );
}

