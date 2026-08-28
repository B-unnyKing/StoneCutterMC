module Packets.toClient.LevelInitialize;
import Packets.Packet;
import std.array : Appender;
class LevelInitialize : Packet {
    immutable ubyte packetID = 0x02;

    this() {}

    ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        return data.data;
    }
}