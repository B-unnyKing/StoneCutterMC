module Packets.toClient.SetPosAndOri;
import Packets.Packet;
import std.array : Appender;
class SetPosAndOri : Packet {
    immutable ubyte packetID = 0x08;
    byte playerID;
    short x;
    short y;
    short z;
    ubyte yaw = 0x02;
    ubyte pitch = 0x02;

    this(byte playerID, short x, short y, short z, ubyte yaw = 0x02, ubyte pitch = 0x02) {
        this.playerID = playerID;
        this.x = x;
        this.y = y;
        this.z = z;
        this.yaw = yaw;
        this.pitch = pitch;
    }

    override ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        data.put(cast(ubyte) playerID);
        appendBigEndian(data, x);
        appendBigEndian(data, y);
        appendBigEndian(data, z);
        data.put(yaw);
        data.put(pitch);
        return data.data;
    }

}