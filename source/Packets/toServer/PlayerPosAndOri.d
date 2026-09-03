module Packets.toServer.PlayerPosAndOri;

import std;
import std.bitmanip;
import Packets.Packet;

class PlayerPosAndOri : Packet {
    immutable ubyte packetID = 0x08;
    ubyte playerID;
    short x;
    short y;
    short z;
    ubyte yaw;
    ubyte pitch;

    this(ubyte playerID, short x, short y, short z, ubyte yaw, ubyte pitch) {
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
        data.put(playerID);
        appendBigEndian(data,x);
        appendBigEndian(data,y);
        appendBigEndian(data,z);
        data.put(yaw);
        data.put(pitch);

        return data.data;
    }
}

PlayerPosAndOri decodePlayerPosAndOri(ubyte[] data) {
    if (data.length < 10) {
        throw new Exception("PlayerPosAndOri packet too short");
    }

    return new PlayerPosAndOri(
        data[1],
        bigEndianToNative!short(data[2 .. 4]),
        bigEndianToNative!short(data[4 .. 6]),
        bigEndianToNative!short(data[6 .. 8]),
        data[8],
        data[9]
    );
}