module Packets.toServer.PlayerMessage;
import Packets.Packet;
import std;
import std.array : Appender;
class PlayerMessage : Packet {
    immutable ubyte packetID = 0x0d;
    byte playerID;
    string message;

    this(byte playerID, string message) {
        this.playerID = playerID;
        this.message = message;
    }

    override ubyte[] serialize() {
        Appender!(ubyte[]) data;

        data.put(packetID);
        data.put(playerID);
        appendFixedString(data, message);
        return data.data;
    }
}

string decodeMessageString(const(ubyte)[] data, size_t offset, size_t length) {
    size_t end = offset + length;
    if (end > data.length) {
        end = data.length;
    }

    while (end > offset && data[end - 1] == ' ') {
        --end;
    }

    return cast(string) cast(char[]) data[offset .. end];
}

PlayerMessage decodePlayerMessage(ubyte[] data) {
    if (data.length < 66) {
        throw new Exception("PlayerMessage packet too short");
    }

    return new PlayerMessage(
        cast(byte) data[1],
        decodeMessageString(data, 2, 64)
    );
}