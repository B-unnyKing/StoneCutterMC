module utils;

import std;
import Packets.Packet;
import Packets.toClient.DespawnPlayer;
import Packets.toClient.DisconnectPlayer;
import Packets.toClient.LevelDataChunk;
import Packets.toClient.LevelFinalize;
import Packets.toClient.LevelInitialize;
import Packets.toClient.Message;
import Packets.toClient.OrientationUpdate;
import Packets.toClient.Ping;
import Packets.toClient.ServerIdentification;
import Packets.toClient.SetBlock;
import Packets.toClient.SetPosAndOri;
import Packets.toClient.SpawnPlayer;
import Packets.toClient.UpdateUserType;
import Packets.toClient.UpPosAndOri;
import Level.Level;
import Blocks.BlockID;
import core.thread : Thread;
import core.time : MonoTime, Duration, msecs;
import core.stdc.stdlib : exit;
import SaveHelper;




void handleClient(TcpSocket client) {

    ubyte[256] buffer;
    auto n = client.receive(buffer[]);

    if (n <= 0) {
        return;
    }

    auto packetID = buffer[0];

    switch (packetID) {
        case 0x00:

        auto response = new ServerIdentification(7,"Armaans Server", "Just a classic server", 0x64);
        client.sendPacket(response);

        auto responseLevelStart = new LevelInitialize();
        client.sendPacket(responseLevelStart);

        

        break;

        case 0x05: 

        break;

        case 0x08:

        break;

        case 0x0d:

        break;

        default:
        writeln("unkown packet recieved!!");

        break;
    }

}







void sendPacket(Socket socket, Packet packet) {
    if (socket is null || !socket.isAlive) return;

    ubyte[] data = packet.serialize();
    ptrdiff_t sent = socket.send(data);

    if (sent == Socket.ERROR) {
        writeln("Failed to send packet.");
    }
}

void handleTerminalCommands() {

    auto command = readln();

    if (command == "END") {
        exit(0);
    }
}

void createServer() {
    ushort port = 25565;
    writeln("creating TCP socket...");
    auto server = new TcpSocket();
    server.blocking = false;
    writeln("binging to internet adress and new port");
    server.bind(new InternetAddress(port));
    writeln("bound successfully to internet adress and port!");
    writeln("server listening on port ", port);
}