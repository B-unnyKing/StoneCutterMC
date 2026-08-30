module server;

import std;
import Packets.Packet;
import Level.Level;
import Blocks.BlockID;


void handleClient(TcpSocket client) {

    ubyte[256] buffer;
    auto n = client.receive(buffer[]);

    if (n <= 0) {
        return;
    }

    auto packetID = buffer[0];

    switch (packetID) {
        case 0x00:

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


void mainTickLoop() {

    while (true) {

    }

}


void putTogether() {

    //Creating socket and writing debug code.
    ushort port = 25565;
    writeln("creating TCP socket...");
    auto server = new TcpSocket();
    server.blocking = false;
    writeln("binging to internet adress and new port");
    server.bind(new InternetAddress(port));
    writeln("bound successfully to internet adress and port!");
    writeln("server listening on port ", port);


}