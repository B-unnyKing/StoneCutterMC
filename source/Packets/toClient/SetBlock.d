module Packets.toClient.SetBlock;
import Packets.Packet;
import std.array : Appender;
class SetBlock : Packet {
    immutable ubyte packetID = 0x06;
    short x;
    short y;
    short z;
    ubyte blockType;

    this(short x, short y, short z, ubyte blockType) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.blockType = blockType;
    }

    override ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        appendBigEndian(data, x);
        appendBigEndian(data, y);
        appendBigEndian(data, z);
        data.put(blockType);
        return data.data;
    }
}