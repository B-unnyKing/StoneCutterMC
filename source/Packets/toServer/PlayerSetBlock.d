module Packets.toServer.PlayerSetBlock;
import Packets.Packet;
import std;
import std.array : Appender;
import std.bitmanip;
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

PlayerSetBlock decodePlayerSetBlock(ubyte[] data) {
    if (data.length < 9) {
        throw new Exception("PlayerSetBlock packet too short");
    }

    return new PlayerSetBlock(
        bigEndianToNative!short(data[1 .. 3]),
        bigEndianToNative!short(data[3 .. 5]),
        bigEndianToNative!short(data[5 .. 7]),
        data[7],
        data[8]
    );
}