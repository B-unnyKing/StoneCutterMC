module Packets.toClient.OrientationUpdate;
import Packets.Packet;
import std.array : Appender;
class OrientationUpdate : Packet {
    immutable ubyte packetID = 0x0b;
    byte playerID;
    byte yaw = 0x02;
    byte pitch = 0x02;

    this(byte playerID, byte yaw = 0x02, byte pitch = 0x02) {
        this.playerID = playerID;
        this.yaw = yaw;
        this.pitch = pitch;
    }

    override ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        data.put(cast(ubyte) playerID);
        data.put(cast(ubyte) yaw);
        data.put(cast(ubyte) pitch);
        return data.data;
    }
}