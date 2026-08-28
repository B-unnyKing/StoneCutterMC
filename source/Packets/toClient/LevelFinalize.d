module Packets.toClient.LevelFinalize;
import Packets.Packet;
import std.array : Appender;
class LevelFinalize : Packet {
    immutable ubyte packetID = 0x04;
    short xSize;
    short ySize;
    short zSize;

    this(short xSize, short ySize, short zSize) {
        this.xSize = xSize;
        this.ySize = ySize;
        this.zSize = zSize;
    }

    ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        appendBigEndian(data, xSize);
        appendBigEndian(data, ySize);
        appendBigEndian(data, zSize);
        return data.data;
    }
}