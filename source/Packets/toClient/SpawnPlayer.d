module Packets.toClient.SpawnPlayer;
import Packets.Packet;
import std.array : Appender;
class SpawnPlayer : Packet {
    immutable ubyte packetID = 0x07;
    byte playerID;
    string playerName;
    short x;
    short y;
    short z;
    ubyte yaw = 0x02;
    ubyte pitch = 0x02;

    this(byte playerID, string playerName, short x, short y, short z, ubyte yaw = 0x02, ubyte pitch = 0x02) {
        this.playerID = playerID;
        this.playerName = playerName;
        this.x = x;
        this.y = y;
        this.z = z;
        this.yaw = yaw;
        this.pitch = pitch;
    }

    ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        data.put(cast(ubyte) playerID);
        appendFixedString(data, playerName);
        appendBigEndian(data, x);
        appendBigEndian(data, y);
        appendBigEndian(data, z);
        data.put(yaw);
        data.put(pitch);
        return data.data;
    }
}