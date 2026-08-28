module Packets.toClient.DespawnPlayer;
import Packets.Packet;
import std.array : Appender;
class DespawnPlayer : Packet {
    immutable ubyte packetID = 0x0c;
    byte playerID;

    this(byte playerID) {
        this.playerID = playerID;
    }

    ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        appendBigEndian(data, playerID);
        return data.data;
    }
}