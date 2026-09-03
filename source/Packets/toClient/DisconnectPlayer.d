module Packets.toClient.DisconnectPlayer;
import Packets.Packet;
import std.array : Appender;
class DisconnectPlayer : Packet {
    immutable ubyte packetID = 0x0e;
    string reason;

    this(string reason) {
        this.reason = reason;
    }

    override ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        appendFixedString(data, reason);
        return data.data;
    }
}