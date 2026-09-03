module Packets.toClient.UpdateUserType;
import Packets.Packet;
import std.array : Appender;
class UpdateUserType : Packet {
    immutable ubyte packetID = 0x0f;
    ubyte userType; // can either be 100 which allows breaking bedrock or 0 which mean they can't

    this(ubyte userType) {
        this.userType = userType;
    }

    override ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        data.put(userType);
        return data.data;
    }
}