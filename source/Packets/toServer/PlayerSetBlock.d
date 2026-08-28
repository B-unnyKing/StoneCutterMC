module Packets.toServer.PlayerSetBlock;
import Packets.Packet;
import std;
import std.array : Appender;
class PlayerSetBlock : Packet {
    immutable ubyte packetID = 0x05;
    short x;
    short y;
    short z;
    ubyte mode;
    ubyte blockType;

    this(short x, short y, short z, ubyte mode, ubyte blockType) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.mode = mode;
        this.blockType = blockType;
    }

    ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        appendBigEndian(data, x);
        appendBigEndian(data, y);
        appendBigEndian(data, z);
        data.put(mode);
        data.put(blockType);

        return data.data;
    }
}