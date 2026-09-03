module Packets.toClient.UpPosAndOri;
import std;
import Packets.Packet;
import std.array : Appender;

class UpPosAndOri : Packet {
    immutable ubyte packetID = 0x09;
    byte playerID;
    byte changeInX;
    byte changeInY;
    byte changeInZ;
    ubyte yaw = 0x02;
    ubyte pitch = 0x02;

    this(byte playerID, byte changeInX, byte changeInY, byte changeInZ, ubyte yaw = 0x02, ubyte pitch = 0x02) {
        this.playerID = playerID;
        this.changeInX = changeInX;
        this.changeInY = changeInY;
        this.changeInZ = changeInZ;
        this.yaw = yaw;
        this.pitch = pitch;
    }

    override ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        data.put(cast(ubyte) playerID);
        data.put(cast(ubyte) changeInX);
        data.put(cast(ubyte) changeInY);
        data.put(cast(ubyte) changeInZ);
        data.put(yaw);
        data.put(pitch);
        return data.data;
    }
}