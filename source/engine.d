module engine;

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
import utils;



class Engine {

    string worldPath;
    SaveHelperClass saveHelper;


    void tick() {

    }
}