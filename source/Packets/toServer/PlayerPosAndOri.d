module Packets.toServer.PlayerPosAndOri;

import std;
import Packets.Packet;

class PlayerPosAndOri : Packet {
    immutable ubyte packetID = 0x08;
    ubyte playerID;
    short x;
    short y;
    short z;
    ubyte yaw;
    ubyte pitch;

    this(ubyte packetID, short x, short y, short z, ubyte yaw, ubyte pitch) {
        this.packetID = packetID;
        this.x = x;
        this.y = y;
        this.z = z;
        this.yaw = yaw;
        this.pitch = pitch;
    }

    ubyte[] serialize() {
        Appender!(ubyte[]) data;

        data.put(packetID);
        data.put(playerID);
        appendBigEndian(data,x);
        appendBigEndian(data,y);
        appendBigEndian(data,z);
        data.put(yaw);
        data.put(pitch);

        return data.data;
    }
}