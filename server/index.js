const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
const Room = require("./models/room");
var io = require("socket.io")(server);

//Middleware
app.use(express.json());

const DB =
  "mongodb+srv://arteius:1C2Iz73HbqV5J6AN@cluster0.p9vr0vx.mongodb.net/?retryWrites=true&w=majority";

io.on("connection", (socket) => {
  console.log("IO connected");
  socket.on("createRoom", async ({ nickname }) => {
    console.log(nickname);
    try {
      //room is created
      let room = new Room();
      let player = {
        socketID: socket.id,
        nickname,
        playerType: "X",
      };
      room.players.push(player);
      room.turn = player;
      //player is stored in the room
      room = await room.save();
      //_id
      const roomId = room._id.toString();
      socket.join(roomId);

      io.to(roomId).emit("createRoomSuccess", room);
    } catch (e) {
      console.log(e);
    }
  });
  socket.on("joinRoom", async ({ nickmame, roomId }) => {
    try {
      if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
        socket.emit("errorOccurred", "Please enter a valid roomID.");
        return;
      }
      let room = await Room.findById(roomId);

      if (room.isJoin) {
        let player = {
          nickmame,
          socketID: socket.id,
          playerType: "O",
        };
        socket.join(roomId);
        room.players.push(player);
        room = await room.save();
        io.to(roomId).emit("joinRoomSuccess", room);
        io.to(roomId).emit("updatePlayers", room.players);
      } else {
        socket.emit("errorOccurred", "Room is Full.");
      }
    } catch (e) {
      console.log(e);
    }
  });
});

mongoose
  .connect(DB)
  .then(() => {
    console.log("DB conecction Succes");
  })
  .catch((e) => {
    console.log(e);
  });

server.listen(port, "0.0.0.0", () => {
  console.log(`Server started and running on port ${port}`);
});
