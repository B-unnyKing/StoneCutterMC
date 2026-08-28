module Packets.toClient.ServerIdentification;
import Packets.Packet;
import std;
import std.array : Appender;

class ServerIdentification : Packet {
    immutable ubyte packetID = 0x00;
    ubyte protocolVersion = 7;
    string serverName = "Armaan's Server!!";
    string serverMOTD = "Just a classic server!!";
    ubyte userType = 0x00; //0x00 equals the person is not op and cannot destroy bedrock while 0x64 means the user is an op and can destroy bedrock

    this(ubyte protocolVersion = 7, string serverName = "Armaan's Server!!",
        string serverMOTD = "Just a classic server!!", ubyte userType = 0x00) {
        this.protocolVersion = protocolVersion;
        this.serverName = serverName;
        this.serverMOTD = serverMOTD;
        this.userType = userType;
    }

    ubyte[] serialize() {
        Appender!(ubyte[]) data;
        data.put(packetID);
        data.put(protocolVersion);
        appendFixedString(data, serverName);
        appendFixedString(data, serverMOTD);
        data.put(userType);
        return data.data;
    }
    
}